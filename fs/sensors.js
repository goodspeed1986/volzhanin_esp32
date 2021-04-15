//load('api_ads1015.js');
load('api_i2c.js');
load('api_pwm.js');
load('api_arduino_onewire.js');
load('ds18b20.js');

let ADS1X15_I2C_addresss = 0x48;
//let ads = Adafruit_ADS1015.create_ads1115(ADS1X15_I2C_addresss);
let bus = I2C.get();
let ow = OneWire.create(12 /* pin */);

let Sensors = {
  pressure: 0,
  voltage: 0,
  temperature: 0,
  tempAddr: "01234567",
  // инициализация датчиков
  init: function () {
    //датчик давления
    //ads.setGain(0x04E3);
    //ads.begin();
    //датчик температуры
    ow.target_search(DEVICE_FAMILY.DS18B20);
    ow.search(this.tempAddr, 0);
    return;
  },
  report: function () {
    return {
      pressure: this.pressure,
      temperature: this.temperature,
      voltage: this.voltage
    };
  },
  // проведение измерения
  measure_pressure: function () {
    let pressDist = 0;
    //for (let j = 0; j < 4; j++) {
      I2C.writeRegW(bus, ADS1X15_I2C_addresss, 0x01, 0x04E3);
      I2C.stop(bus);
      I2C.writeRegW(bus, ADS1X15_I2C_addresss, 0x00, 0x0000);
      I2C.stop(bus);
      pressDist += I2C.readRegW(bus, ADS1X15_I2C_addresss, 0x00);
      //pressDist += ads.readADC_Differential_0_1();
      //Sys.usleep(250000);
      // задержка между измерениями в датчике давления
    //}
    this.pressure = (20.48 * pressDist) / (/*4 * */32768); // измерение давления
    return;
  },
  measure_temperature: function () {
    this.temperature = getTemp(ow, this.tempAddr);
    return;
  },
  measure_voltage: function () {
    let voltDest = 0;
    I2C.writeRegW(bus, ADS1X15_I2C_addresss, 0x01, 0x64E3);
    I2C.stop(bus);
    I2C.writeRegW(bus, ADS1X15_I2C_addresss, 0x00, 0x0000);
    I2C.stop(bus);
    voltDest = I2C.readRegW(bus, ADS1X15_I2C_addresss, 0x00);
    this.voltage = (2.048 * 3 * voltDest) / 32768; // измерение напряжения
    //this.voltage = ads.readADC_SingleEnded(2)*3/100;
    return;
  }
};