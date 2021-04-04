//load('api_config.js');
load('api_events.js');
load('api_gpio.js');
load('api_ads1015.js');
load('api_pwm.js');
load('api_arduino_onewire.js');
load('ds18b20.js');
load('api_timer.js');
load('api_sys.js');
load('api_math.js');
load('api_bt_gatts.js');

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
  state: 1, //1-Торцовка, 2-Оплавление, 3-Прогрев, 4-Тех.пауза, 5-Сварка
  error: 0, //1-давление вне диапазона, 2-20 секунд до окончания этапы, 3-низкий заряд батареи, 4-низкая температур окр. среды
  pressure: 0.0, //Текущее давление в системе
  sp_pressure: [0, 0, 0, 0, 0], //Уставка по давлению на каждом этапе
  state_time: [0, 0, 0, 0, 0], //Время каждого этапа
  begin_ts: 0, //TS начала сварки
  temp: 0.0, //Температура окружающей среды
  bat_voltage: 0.0 //Заряд батареи
};

let arch_welding = {
  s1: "", //Архив значений давления этап Торцовки
  s2: "", //Архив значений давления этап Оплавления
  s3: "", //Архив значений давления этап Прогрев
  s4: "", //Архив значений давления этап Тех. пауза
  s5: "", //Архив значений давелния этап Сварки
  arch_state: 1, //Номер архива для получения
  offset: 0 //смещение в архиве
};

load('ads.js');

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




let f = ffi('double sum(double, double)');
print('Calling C sum:', f(1, 2));

let f1 = ffi('char *foo(struct mg_str *)');
/*let f2 = ffi('char *allocStr(int)'); 
let str1 = f2(10000);*/
function getRandom(min, max) {
  let random = Math.random() * (max - min) + min;
  return Math.round(random * 100) / 100; //Максимум не включается, минимум включается
}

let subscriber = undefined;
//8fbd742c-3d7d-4a94-839e-45c265a2e7f9
//3b4001a1-6cf9-41aa-991c-6092c90df18e
//9250fdf0-d060-4a17-aea1-2895200ab74c
//0b93091a-adec-4601-a4db-ada9e95de511
GATTS.registerService(
  "12345678-90ab-cdef-0123-456789abcdef",
  GATT.SEC_LEVEL_NONE,
  [
    ["11111111-90ab-cdef-0123-456789abcdef", GATT.PROP_RWNI(1, 1, 0, 0)],
    ["22222222-90ab-cdef-0123-456789abcdef", GATT.PROP_RWNI(1, 1, 1, 0)],
  ],
  function svch(c, ev, arg) {
    print(JSON.stringify(c), ev, arg, JSON.stringify(arg));
    if (ev === GATTS.EV_CONNECT) {
      print(c.addr, "connected");
      return GATT.STATUS_OK;
    } else if (ev === GATTS.EV_READ) { 
      //READ ARCHIVE STATE FROM DEVICE 
      if (arg.uuid === "11111111-90ab-cdef-0123-456789abcdef") { 
        let str1 = "";
        str1 = arch_welding["s" + JSON.stringify(arch_welding.arch_state)].slice(arg.offset + arch_welding.offset, arg.offset + arch_welding.offset + c.mtu - 1)
        GATTS.sendRespData(c, arg, str1);
        print("Chunk="+str2);
        print("Offset", arg.offset + arch_welding.offset);
      //READ CURRENT STATE FROM DEVICE 
      } else if (arg.uuid === "22222222-90ab-cdef-0123-456789abcdef") {
        GATTS.sendRespData(c, arg, "World");
      }
      return GATT.STATUS_OK;
    } else if (ev === GATTS.EV_WRITE) { 
      //WRITE ARCHIVE PARAMS TO DEVICE
      if (arg.uuid === "11111111-90ab-cdef-0123-456789abcdef") {
        let inJson = JSON.parse(arg.data);
        arch_welding.offset = inJson.offset;
        arch_welding.arch_state = inJson.arch_state;
        // RESET ALL ARCHIVES WHEN FINISH READING ARCHIVES
        if (arch_welding.state === 0) {
          for (let i = 1; i < 6; i++) { 
            arch_welding["s1"+i] = "";
          }
        }
      //WRITE CURRENT PARAMS TO DEVICE  
      } else if (arg.uuid === "22222222-90ab-cdef-0123-456789abcdef"){
        let inJson = JSON.parse(arg.data);
        welding.state = inJson.state;
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
  if (welding.state > 0) {
    arch_welding["s" + JSON.stringify(welding.state)] = arch_welding["s" + JSON.stringify(welding.state)] + PressureStr(welding.pressure) + ";";
  }
  let x = GPIO.toggle(ledBlinkRED);
}, null);

Timer.set(10000, Timer.REPEAT, function () {
  print(JSON.stringify(arch_welding["s" + JSON.stringify(welding.state)].length));
}, null);



Timer.set(1000, Timer.REPEAT, function () {
  if (!subscriber) return;
  let se = subscriber;
  //let mtu = "MTU" + se.c.mtu;
  let notifyStr = JSON.stringify(welding.state) + ";" + JSON.stringify(welding.error) + ";" + PressureStr(welding.pressure);
  GATTS.notify(se.c, se.mode, se.handle, notifyStr);
}, null);

function PressureStr(pressure) {
  let str2 = "";
  str2 = JSON.stringify(pressure);
  let pt = str2.indexOf('.');
  return str2.slice(0, pt + 2);
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