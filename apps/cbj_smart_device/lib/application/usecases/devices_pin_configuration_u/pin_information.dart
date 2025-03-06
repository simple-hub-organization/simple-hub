///  These class will save all the information that we have about pin
class PinInformation {
  PinInformation({
    this.isInUse,
    this.category,
    this.name,
    this.gpioValue,
    this.mode,
    this.model,
    this.description,
    this.gpioColumn,
    this.index,
    this.v,
    this.ph,
    this.bcmOrLinuxGpio,
    this.wPi,
    this.pinAndPhysicalPinConfiguration,
  }) {
    isInUse = isInUse ?? false;
    onDuration = 0;
  }

  ///  Save the state of the pin, used or free to be taken
  bool? isInUse = false;

  ///  Category/spec of the pins, Examples: Power, GPIO, USB/Audio/IR, Audio, Debug Port（UART0）
  String? category;

  ///  Name from the site, Examples: VDD_5V, SYS_3.3V, GND, SCL, SDA, CS, GPIOL11/IR-RX, DEBUG_RX(UART_RXD0)/GPIOA5/PWM0
  String? name;

  /// The gpio value, Examples: 5V, 3V3, GND, IRRX, RXD, TXD
  String? gpioValue;

  ///  Examples: IN, OUT, OFF, ALT5
  String? mode;

  ///  Examples: RTL8188CUS/8188EU 802.11n WLAN Adapter, RT2070 Wireless Adapter, mi Wi-Fi mt7601
  String? model;

  ///  Examples: 5V Power Out, USB1 DP Signal, GPIOL11 or IR Receive, I2S/PCM Serial Data Input
  String? description;

  ///  Gpio column, Examples: 1, 2
  int? gpioColumn;

  ///  Examples: 1, 2, 3, 4
  int? index;

  ///  Can be 0 or 1
  int? v;

  ///  Examples: 25, 26
  int? ph;

  ///  Examples: 12, 11, 203
  int? bcmOrLinuxGpio;

  ///  Pin configuration in the library WiringNP, Examples: 8, 9, 7
  int? wPi;

  ///  Examples: 3, 5, 7
  int? pinAndPhysicalPinConfiguration;

  ///  Value of -1 is on forever
  double? onDuration;
}
