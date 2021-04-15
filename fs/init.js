//load('api_config.js');
load('api_events.js');
load('api_gpio.js');
load('api_timer.js');
load('api_sys.js');
load('api_math.js');
load('api_bt_gatts.js');
load('sensors.js');

//let btn = Cfg.get('board.btn1.pin');              // Built-in button GPIO


let ledBlinkRED = 5; // leds
let ledBlinkGREEN = 2;// leds
let ledBlinkBLUE = 4;// leds
let DC_enable = 26; // Включает преобразователь на 12 вольт для запитки токовой петли. Для экономии батарейки можно отключить.
let Power_present = 35; // На микросхеме заряда пришло 5 вольт. Можно заряжаться (вход)
let Charge_enable = 25; //Подаем 1 для отключения зарядки АКБ. Например по температуре.
let Buzzer = 13;		// Пищалка
let NextButton = 18;		// кнопка Перехода на следующий этап

let welding = {
  state: 1, //1-Оплавление, 2-Прогрев, 3-Тех.пауза, 4-Осадка, 5-Сварка, 6-Сварка с пониженным давлением
  alert: 0, //1-давление вне диапазона, 2-20 секунд до окончания этапы, 3-низкий заряд батареи, 4-низкая температур окр. среды
  pressure: 0.0, //Текущее давление в системе
  temperature: 0.0, //Температура окружающей среды
  bat_voltage: 0.0 //Заряд батареи
};

let welding_param = {
  id: "12345678",
  sp_pressure: [0, 0, 0, 0, 0, 0], //Уставка по давлению на каждом этапе
  state_time: [0, 0, 0, 0, 0, 0], //Время каждого этапа
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


GPIO.set_mode(ledBlinkRED, GPIO.MODE_OUTPUT);
GPIO.set_mode(ledBlinkGREEN, GPIO.MODE_OUTPUT);
GPIO.set_mode(ledBlinkBLUE, GPIO.MODE_OUTPUT);
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

/*function getRandom(min, max) {
  let random = Math.random() * (max - min) + min;
  return Math.round(random * 100) / 100; //Максимум не включается, минимум включается
}*/

let subscriber = undefined;
//8fbd742c-3d7d-4a94-839e-45c265a2e7f9 main
//3b4001a1-6cf9-41aa-991c-6092c909arch archive
//9250fdf0-d060-4a17-aea1-28952009weld welding
GATTS.registerService(
  "8fbd742c-3d7d-4a94-839e-45c265a2e7f9",
  GATT.SEC_LEVEL_NONE,
  [
    ["3b4001a1-6cf9-41aa-991c-6092c909arch", GATT.PROP_RWNI(1, 1, 0, 0)],
    ["9250fdf0-d060-4a17-aea1-28952009weld", GATT.PROP_RWNI(1, 1, 1, 0)],
  ],
  function svch(c, ev, arg) {
    //print(JSON.stringify(c), ev, arg, JSON.stringify(arg));
    if (ev === GATTS.EV_CONNECT) {
      print(c.addr, "connected");
      return GATT.STATUS_OK;
    } else if (ev === GATTS.EV_READ) {
      //READ ARCHIVE STATE FROM DEVICE (arch_welding)
      //23.5;23.5;12.5;34.5;12.8;...34.6
      if (arg.uuid === "3b4001a1-6cf9-41aa-991c-6092c909arch") {
        let str1 = "";
        str1 = arch_welding["s" + JSON.stringify(arch_welding.arch_state)].slice(arg.offset + arch_welding.offset, arg.offset + arch_welding.offset + c.mtu - 1)
        GATTS.sendRespData(c, arg, str1);
        print("Chunk=" + str1);
        print("Offset", arg.offset + arch_welding.offset);
        //READ CURRENT STATE FROM DEVICE (welding_param)
        //123456789;106;25;106;0;31.8;900;1800;40;9600;49;123456789;823456789
      } else if (arg.uuid === "9250fdf0-d060-4a17-aea1-28952009weld") {
        let str2 = "";
        str2 = JSON.stringify(welding_param.id) + ";";
        for (let i = 1; i < 6; i++) {
          str2 = str2 + JSON.stringify(welding_param.sp_pressure[i]) + ";";
        }
        for (let i = 1; i < 6; i++) {
          str2 = str2 + JSON.stringify(welding_param.state_time[i]) + ";";
        }
        str2 = str2 + JSON.stringify(welding_param.begin_ts) + ";";
        str2 = str2 + JSON.stringify(welding_param.end_ts);
        GATTS.sendRespData(c, arg, str2);
      }
      return GATT.STATUS_OK;
    } else if (ev === GATTS.EV_WRITE) {
      //WRITE ARCHIVE PARAMS TO DEVICE
      //{"offset":0,"arch_state":1}
      if (arg.uuid === "3b4001a1-6cf9-41aa-991c-6092c909arch") {
        let archive_params = JSON.parse(arg.data);
        arch_welding.offset = archive_params.offset;
        arch_welding.arch_state = archive_params.arch_state;
        // RESET ALL ARCHIVES WHEN FINISH READING ARCHIVES
        //{"offset":0,"arch_state":0}
        if (arch_welding.state === 0) {
          for (let i = 1; i < 6; i++) {
            arch_welding["s" + i] = "";
          }
          gc(true); //garbage collector ON
        }
        print("archive_params", JSON.stringify(archive_params));
        //WRITE CURRENT PARAMS TO DEVICE  cmd:0 - welding_param, cmd:1 - change state
        //{cmd:0, sp_p:[106,25,106,0,31.8], st_t:[900,1800,40,9600,49], ts:123456789, id:"12345678"}
        //{cmd:1, state:1}
      } else if (arg.uuid === "9250fdf0-d060-4a17-aea1-28952009weld") {
        let write_params = JSON.parse(arg.data);
        if (write_params.cmd === 0) {
          welding_param.id = write_params.id;
          welding_param.sp_pressure = write_params.sp_p;
          welding_param.state_time = write_params.st_t;
        } else {
          welding.state = write_params.state;
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
    arch_welding["s" + JSON.stringify(welding.state)] = arch_welding["s" + JSON.stringify(welding.state)] + Number2String(welding.pressure) + ";";
  }
  let x = GPIO.toggle(ledBlinkRED);

  if (subscriber) {
    let se = subscriber;
    //let mtu = "MTU" + se.c.mtu;
    //NOTIFY CURRENT STATE, PARAMS
    //1;0;23.5;4.2;12.1
    let notifyStr = JSON.stringify(welding.state) + ";" + JSON.stringify(welding.error) + ";";
    notifyStr = notifyStr + Number2String(welding.pressure) + ";" + Number2String(welding.bat_voltage) + Number2String(welding.temperature);
    GATTS.notify(se.c, se.mode, se.handle, notifyStr);
  }
}, null);

Timer.set(10000, Timer.REPEAT, function () {
  Sensors.measure_temperature();
  welding.temperature = Sensors.report().temperature;
  print("Temperature:", JSON.stringify(welding.temperature));
  Sensors.measure_voltage();
  welding.bat_voltage = Sensors.report().voltage;
  print("Battery Voltage:", JSON.stringify(welding.bat_voltage));
  print(JSON.stringify(arch_welding["s" + JSON.stringify(welding.state)].length));
  gc(true);
}, null);

function Number2String(num) {
  let str = "";
  str = JSON.stringify(num);
  let pt = str.indexOf('.');
  return str.slice(0, pt + 2);
}
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