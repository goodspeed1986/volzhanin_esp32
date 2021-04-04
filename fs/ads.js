let ADS1X15_I2C_addresss = 0x48 ;

let ads = Adafruit_ADS1015.create(ADS1X15_I2C_addresss);
ads.setGain(0x04E3); 
ads.begin();

let cntPressure = 0;
let adc0 = 0.0;
Timer.set(250, Timer.REPEAT, function(v) {
  
    if (cntPressure < 4) {
      adc0 = adc0 + ads.readADC_Differential_0_1();
      cntPressure = cntPressure + 1;
    } else
    { 
      v.pressure = adc0 / 400;
      cntPressure = 0;
      adc0 = 0.0;
      print('Pressure: ', JSON.stringify(v.pressure));
    }
}, welding);