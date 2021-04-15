load('api_events.js');
load('api_timer.js');
load('api_sys.js');
load('api_math.js');
load("api_dataview.js");
load('sensors.js');

Sensors.init();

let buf_len = 20000;
//let buf = Sys.malloc(buf_len);
let arch = {s:""};
//arch.s = mkstr(buf, 0, buf_len, true);
//arch.s = Sys._sbuf(buf_len);

Timer.set(100, Timer.REPEAT, function () {
    
    arch.s= arch.s + "1234567890123456789123456789123456789123456789123456789123456789" + ";";

  }, null);

  Timer.set(30000, Timer.REPEAT, function () {
    print(JSON.stringify(arch.s.length));
    arch.s = '';
    //Sys.free(buf);
    gc(true);
    //buf = Sys.malloc(buf_len);
    //arch.s = mkstr(buf, 0, buf_len, true);
    Sensors.measure_pressure();
    let pressure = Sensors.report().pressure;
    print("Pressure:", JSON.stringify(pressure));
  }, null);