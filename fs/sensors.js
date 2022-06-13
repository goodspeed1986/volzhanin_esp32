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
  p_in_min: 4,
  p_in_max: 20,
  p_out_min: 0,
  p_out_max: 60,

  // инициализация датчиков
  init: function () {
    //датчик давления
    this.p_in_min = Cfg.get('sensors.p_in_min');
    this.p_in_max = Cfg.get('sensors.p_in_max');
    this.p_out_min = Cfg.get('sensors.p_out_min');
    this.p_out_max = Cfg.get('sensors.p_out_max');
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
    //}
    this.pressure = (20.48 * pressDist) / (/*4 * */32768); // измерение давления
    //Преобразования давления из 4..20 мА в бары
    this.pressure = (this.pressure - this.p_in_min) * (this.p_out_max - this.p_out_min) / (this.p_in_max - this.p_in_min) + this.p_out_min;
    if (this.pressure < 0) {this.pressure = 0;}
    return;
  },
  measure_temperature: function () {
    if (getTemp(ow, this.tempAddr) < 60) {
      this.temperature = getTemp(ow, this.tempAddr);
    } else {
      this.temperature = 60;
    }
    
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

let MCP23x17_I2C_address = 0x20;
let IODIRA = 0x00; 
let IODIRB = 0x01;
let MGPIOA = 0x12; // Синие LED
let MGPIOB = 0x13; // Красные LED
let OLATA = 0x14;
let OLATB = 0x15;

let Led = {
  ledState : [0x7F, 0xBF, 0xDF, 0xFB, 0xF7, 0xF7],
  ledInd : [0xFC, 0xFB, 0xE7, 0xDF],
  set_state_led: function (led_state) {
    if (led_state > 0 && led_state < 10) {
      I2C.writeRegB(bus, MCP23x17_I2C_address, IODIRB, 0x00);
      I2C.writeRegB(bus, MCP23x17_I2C_address, MGPIOB, this.ledState[led_state-1]);
      I2C.writeRegB(bus, MCP23x17_I2C_address, OLATB, this.ledState[led_state-1]);
      I2C.stop(bus);
    } else {
      I2C.writeRegB(bus, MCP23x17_I2C_address, IODIRB, 0x00);
      I2C.writeRegB(bus, MCP23x17_I2C_address, MGPIOB, 0xFF);
      I2C.writeRegB(bus, MCP23x17_I2C_address, OLATB, 0xFF);
      I2C.stop(bus);
    }
  },

  set_ind_led: function (led_ind) {
    let led = 0xFF;
    for (let j = 0; j < 4; j++) {
      if (led_ind[j]>0) {
        led = led & this.ledInd[j];
      }
    }
    I2C.writeRegB(bus, MCP23x17_I2C_address, IODIRA, 0x00);
    I2C.writeRegB(bus, MCP23x17_I2C_address, MGPIOA, led);
    I2C.writeRegB(bus, MCP23x17_I2C_address, OLATA, led);
    I2C.stop(bus);
  }
}