load('api_config.js');
load('api_events.js');
load('api_gpio.js');
load('api_timer.js');
load('api_sys.js');
load('api_math.js');
load('api_bt_gatts.js');
load('sensors.js');

//let btn = Cfg.get('board.btn1.pin');              // Built-in button GPIO

let led_Ind = [0, 0, 0, 0]; //"alarm", "battery", "button", "ble"
//let ledBlinkRED = 5; // leds
//let ledBlinkGREEN = 2;// leds
//let ledBlinkBLUE = 4;// leds
let DC_enable = 26; // Включает преобразователь на 12 вольт для запитки токовой петли. Для экономии батарейки можно отключить.
let Power_present = 35; // На микросхеме заряда пришло 5 вольт. Можно заряжаться (вход)
let Charge_enable = 25; //Подаем 1 для отключения зарядки АКБ. Например по температуре.
let Buzzer = 13;		// Пищалка
let NextButton = 18;		// кнопка Перехода на следующий этап

let welding = {
  state: 0, //1-Оплавление, 2-Прогрев, 3-Тех.пауза, 4-Осадка, 5-Сварка, 6-Сварка с пониженным давлением
  alert: [0, 0, 0, 0], //1-давление вне диапазона, 2-20 секунд до окончания этапы, 3-низкий заряд батареи, 4-низкая температур окр. среды
  pressure: 0.0, //Текущее давление в системе
  temperature: 0.0, //Температура окружающей среды
  bat_voltage: 0.0, //Заряд батареи
  cur_time:0 //Время работы на текущем этапе
};

let welding_param = {
  id: "12345678",
  sp_pressure: [0, 0, 0, 0, 0, 0], //Уставка по давлению на каждом этапе
  state_time:  [0, 0, 0, 0, 0, 0], //Время каждого этапа по стандарту
  actual_time: [0, 0, 0, 0, 0, 0], //Время каждого этапа по факту
  begin_ts: 0, //TS начала сварки
  end_ts: 0 //TS конца сварки
};

let arch_welding = {
  s1: "", //Архив значений давления этап Оплавления
  s2: "", //Архив значений давления этап Прогрев
  s3: "", //Архив значений давления этап Тех. пауза
  s4: "", //Архив значения давления этап Осадки
  s5: "", //Архив значений давления этап Сварки
  s6: "", //Архив значений давления этап Сварки с пониженным давлением
  arch_state: 1, //Номер архива для получения
  offset: 0 //смещение в архиве
};


//GPIO.set_mode(ledBlinkRED, GPIO.MODE_OUTPUT);
//GPIO.set_mode(ledBlinkGREEN, GPIO.MODE_OUTPUT);
//GPIO.set_mode(ledBlinkBLUE, GPIO.MODE_OUTPUT);
GPIO.set_mode(Charge_enable, GPIO.MODE_OUTPUT);
GPIO.set_mode(DC_enable, GPIO.MODE_OUTPUT);
GPIO.set_mode(Power_present, GPIO.MODE_INPUT);
GPIO.set_pull(Power_present, GPIO.PULL_UP);
GPIO.set_mode(Buzzer, GPIO.MODE_OUTPUT);
GPIO.set_mode(NextButton, GPIO.MODE_INPUT);

GPIO.write(Charge_enable, 0);
GPIO.write(DC_enable, 1);

Sensors.init();

/*let f = ffi('double sum(double, double)');
print('Calling C sum:', f(1, 2));

let f1 = ffi('char *foo(struct mg_str *)');*/

function getRandom(min, max) {
  let random = Math.random() * (max - min) + min;
  return Math.round(random * 100) / 100; //Максимум не включается, минимум включается
}

let subscriber = undefined;
//8fbd742c-3d7d-4a94-839e-45c265a2e7f9 main
//67a4eeb9-98f1-4186-8717-df670471d68b archive
//4e75c6fe-d008-49f2-b182-fe231eed747c welding
GATTS.registerService(
  "8fbd742c-3d7d-4a94-839e-45c265a2e7f9",
  GATT.SEC_LEVEL_NONE,
  [
    ["67a4eeb9-98f1-4186-8717-df670471d68b", GATT.PROP_RWNI(1, 1, 0, 0)],
    ["4e75c6fe-d008-49f2-b182-fe231eed747c", GATT.PROP_RWNI(1, 1, 1, 0)],
  ],
  function svch(c, ev, arg) {
    //print(JSON.stringify(c), ev, arg, JSON.stringify(arg));
    if (ev === GATTS.EV_CONNECT) {
      print(c.addr, "connected");
      return GATT.STATUS_OK;
    } else if (ev === GATTS.EV_READ) {
      //READ ARCHIVE STATE FROM DEVICE (arch_welding)
      //23.5;23.5;12.5;34.5;12.8;...34.6
      if (arg.uuid === "67a4eeb9-98f1-4186-8717-df670471d68b") {
        let str1 = "";
        if (arch_welding.arch_state > 0) {
          str1 = arch_welding["s" + JSON.stringify(arch_welding.arch_state)].slice(arg.offset + arch_welding.offset, arg.offset + arch_welding.offset + c.mtu - 1)
        }
        GATTS.sendRespData(c, arg, str1);
        print("Chunk=" + str1);
        print("Offset", arg.offset + arch_welding.offset);
        
        //READ CURRENT STATE FROM DEVICE (welding_param)
        //"123456789";106;25;106;0;31.8;12;900;1800;40;9600;49;50;123456789;0
      } else if (arg.uuid === "4e75c6fe-d008-49f2-b182-fe231eed747c") {
        let str2 = "";
        str2 = JSON.stringify(welding_param.id) + ";";
        for (let i = 0; i < 6; i++) {
          str2 = str2 + JSON.stringify(welding_param.sp_pressure[i]) + ";";
        }
        for (let i = 0; i < 6; i++) {
          str2 = str2 + JSON.stringify(welding_param.state_time[i]) + ";";
        }
        for (let i = 0; i < 6; i++) {
          str2 = str2 + JSON.stringify(welding_param.actual_time[i]) + ";";
        }
        str2 = str2 + JSON.stringify(welding_param.begin_ts) + ";";
        str2 = str2 + JSON.stringify(welding_param.end_ts);
        str2 = 
        GATTS.sendRespData(c, arg, str2);
      }
      return GATT.STATUS_OK;
    } else if (ev === GATTS.EV_WRITE) {
      //WRITE ARCHIVE PARAMS TO DEVICE
      //{"offset":0,"arch_state":1}
      if (arg.uuid === "67a4eeb9-98f1-4186-8717-df670471d68b") {
        let archive_params = JSON.parse(arg.data);
        arch_welding.offset = archive_params.offset;
        arch_welding.arch_state = archive_params.arch_state;
        // RESET ALL ARCHIVES WHEN FINISH READING ARCHIVES
        //{"offset":0,"arch_state":0}
        if (arch_welding.arch_state === 0) {
          for (let i = 1; i < 6; i++) {
            arch_welding["s" + JSON.stringify(i)] = "";
          }
          for (let i = 0; i < 6; i++) {
            welding_param.actual_time[i] = 0;
          }
          gc(true); //garbage collector ON
        }
        print("archive_params", JSON.stringify(archive_params));
        //WRITE CURRENT PARAMS TO DEVICE  cmd:0 - welding_param, cmd:1 - change state
        //{cmd:0, sp_p:[106,25,106,47,31.8,12], st_t:[900,1800,40,9600,49,50], ts:123456789, id:"12345678"}
        //{cmd:1, state:1}
      } else if (arg.uuid === "4e75c6fe-d008-49f2-b182-fe231eed747c") {
        let write_params = JSON.parse(arg.data);
        if (write_params.cmd === 0) {
          welding_param.id = write_params.id;
          welding_param.sp_pressure = write_params.sp_p;
          welding_param.state_time = write_params.st_t;
          welding_param.begin_ts = write_params.ts;
        } 
        if (write_params.cmd === 1) {
          if (welding.state > 0) {
            welding_param.actual_time[welding.state-1] = welding.cur_time;
          }
          welding.state = write_params.state;
          welding.cur_time = 0;
        }
        if (write_params.cmd === 2) {
          Sensors.p_out_min = write_params.sensors.p_out_min;
          Sensors.p_out_max = write_params.sensors.p_out_max;
          Sensors.p_in_min = write_params.sensors.p_in_min;
          Sensors.p_in_max = write_params.sensors.p_in_max;
          Cfg.set({sensors: {p_out_min: Sensors.p_out_min, p_out_max: Sensors.p_out_max, p_in_min: Sensors.p_in_min, p_in_max: Sensors.p_in_max}}); 
        }
        print("write_params", JSON.stringify(write_params));
        
      }
      return GATT.STATUS_OK;
    } else if (ev === GATTS.EV_NOTIFY_MODE) { //SUBSCRIBE TO DEVICE
      if (arg.mode !== GATT.NOTIFY_MODE_OFF) {
        print(c.addr + " subscribed");
        subscriber = { c: c, mode: arg.mode, handle: arg.handle };
      } else {
        print(c.addr + " unsubscribed");
        subscriber = undefined;
      }
      return GATT.STATUS_OK;
    } else if (ev === GATTS.EV_DISCONNECT) {
      print(c.addr, "disconnected");
      subscriber = undefined;
      return GATT.STATUS_OK;
    }
    return GATT.STATUS_REQUEST_NOT_SUPPORTED;
  });

Timer.set(1000, Timer.REPEAT, function () {
  Sensors.measure_pressure();
  welding.pressure = Sensors.report().pressure;
  
  print("Pressure:", JSON.stringify(welding.pressure));
  if (welding.state > 0) {
    welding.cur_time = welding.cur_time + 1;
    //welding.pressure = getRandom(welding_param.sp_pressure[welding.state-1]-5,welding_param.sp_pressure[welding.state-1]+5);
    if (welding.cur_time < welding_param.state_time[welding.state-1] + 600) {
      arch_welding["s" + JSON.stringify(welding.state)] = arch_welding["s" + JSON.stringify(welding.state)] + Number2String(welding.pressure) + ";";
    }  
  }

}, null);

Timer.set(10000, Timer.REPEAT, function () {
  Sensors.measure_temperature();
  welding.temperature = Sensors.report().temperature;
  //welding.temperature = 24.5;
  print("Temperature:", JSON.stringify(welding.temperature));
  Sensors.measure_voltage();
  welding.bat_voltage = Sensors.report().voltage;
  //welding.bat_voltage = 4.2;
  print("Battery Voltage:", JSON.stringify(welding.bat_voltage));
  //print(JSON.stringify(arch_welding["s" + JSON.stringify(welding.state)].length));
  //gc(true);
}, null);

Timer.set(1000, Timer.REPEAT, function () {
  if (subscriber) {
    let se = subscriber;
    //let mtu = "MTU" + se.c.mtu;
    //NOTIFY CURRENT STATE, PARAMS
    //1;0;0;0;0;23.5;4.2;12.1
    let notifyStr = JSON.stringify(welding.state) + ";" + JSON.stringify(welding.cur_time) + ";"+ JSON.stringify(welding.alert[0]) + ";" + JSON.stringify(welding.alert[1]) + ";";
    notifyStr = notifyStr + JSON.stringify(welding.alert[2]) + ";" + JSON.stringify(welding.alert[3]) + ";"
    notifyStr = notifyStr + Number2String(welding.pressure) + ";" + Number2String(welding.bat_voltage) + ";" + Number2String(welding.temperature) + ";" + JSON.stringify(Sys.free_ram());
    GATTS.notify(se.c, se.mode, se.handle, notifyStr);
  }
}, null);

function Number2String(num) {
  let str = "";
  str = JSON.stringify(num);
  let pt = str.indexOf('.');
  return str.slice(0, pt + 2);
}

let x = 0; let y =0;
Timer.set(10000, Timer.REPEAT, function () {
  if (x<6) {
    Led.set_state_led(x);
    print("LED x:", x);
    x++;
  } else {
    x = 0;
  }
  if (y<4) {
    led_Ind[y] = 1;
    Led.set_ind_led(led_Ind);
    print("LED:", y);
    y++;
  } else {
    y = 0;
    led_Ind[0] = 0;
    led_Ind[1] = 0;
    led_Ind[2] = 0;
    led_Ind[3] = 0;
    Led.set_ind_led(led_Ind);
  }
  
 
  
}, null);

GPIO.set_button_handler(NextButton, GPIO.PULL_UP, GPIO.INT_EDGE_NEG, 200,
  function(x) {
    print('Button press, pin: ', x);
  }, null);
  /*
function splitString(inTxt, sepChr) {
let pos = inTxt.indexOf(sepChr);
let out = [];
let part = '';
while (pos !== -1) {
part = inTxt.slice(0, pos);
if (part.length > 0) out.push(part);inTxt = inTxt.slice(pos+1, inTxt.length);
pos = inTxt.indexOf(sepChr);
}
out.push(inTxt);
return out;
}
*/