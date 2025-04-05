// Values from here https://tasmota.github.io/docs/Components/
// Stored in the following way.
// MapEntry(Number label: [UI Label, Comment])

Map<int, List<String>> gpioOverviewTasmota = {
  0: ['None', 'Not used'],
  32: ['Button1', 'Button active low, internal pull-up resistor'],
  33: ['Button2', 'Button active low, internal pull-up resistor'],
  34: ['Button3', 'Button active low, internal pull-up resistor'],
  35: ['Button4', 'Button active low, internal pull-up resistor'],
  36: ['Button5', 'Button active low, internal pull-up resistor'],
  37: ['Button6', 'Button active low, internal pull-up resistor'],
  38: ['Button7', 'Button active low, internal pull-up resistor'],
  39: ['Button8', 'Button active low, internal pull-up resistor'],
  64: ['Button_n1', 'Button active low, no internal pull-up resistor'],
  65: ['Button_n2', 'Button active low, no internal pull-up resistor'],
  66: ['Button_n3', 'Button active low, no internal pull-up resistor'],
  67: ['Button_n4', 'Button active low, no internal pull-up resistor'],
  68: ['Button_n5', 'Button active low, no internal pull-up resistor'],
  69: ['Button_n6', 'Button active low, no internal pull-up resistor'],
  70: ['Button_n7', 'Button active low, no internal pull-up resistor'],
  71: ['Button_n8', 'Button active low, no internal pull-up resistor'],
  96: [
    'Button_i1',
    'Button inverted, active high with internal pull-up resistor',
  ],
  97: [
    'Button_i2',
    'Button inverted, active high with internal pull-up resistor',
  ],
  160: ['Switch1', 'Switch, internal pull-up resistor'],
  192: ['Switch_n1', 'Switch, no pull-up resistor'],
  224: ['Relay1', 'Relay'],
  255: ['User', 'User pin'],
  288: ['Led1', '4 x Leds'],
  320: ['Led_i1', '4 x Leds'],
  352: ['Counter1', '4 x Counter'],
};

/// For 32bit microcontroller running Tasmota
Map<int, List<String>> gpioOverviewTasmota32 = {
  0: ['None', 'Not used'],
  1: ['None', 'Not used'],
  32: ['Button1', 'Button active low, internal pull-up resistor'],
};
