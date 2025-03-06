import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/device_configuration_base_class.dart';
import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';

/// Configuration for the NanoPi Duo 2
class NanoPiDuo2Configuration extends DeviceConfigurationBaseClass {
  /// Setting the configuration by PinInformation list
  NanoPiDuo2Configuration() {
    pinList = _pinListNanoPiDuo2;
  }

  static final List<PinInformation> _pinListNanoPiDuo2 = <PinInformation>[
    PinInformation(
      category: 'Power',
      pinAndPhysicalPinConfiguration: 1,
      gpioColumn: 1,
      gpioValue: '5V',
      name: 'VDD_5V',
    ),
    PinInformation(
      category: 'DEBUG',
      pinAndPhysicalPinConfiguration: 2,
      gpioColumn: 2,
      gpioValue: 'RXD',
      name: 'DEBUG_RX(UART_RXD0)/PWM0',
      v: 00,
      mode: 'IN',
      wPi: 15,
      bcmOrLinuxGpio: 6,
    ),
    PinInformation(
      category: 'Power',
      pinAndPhysicalPinConfiguration: 3,
      gpioColumn: 1,
      gpioValue: '5V',
      name: 'VDD_5V',
    ),
    PinInformation(
      category: 'DEBUG',
      pinAndPhysicalPinConfiguration: 4,
      gpioColumn: 2,
      gpioValue: 'TXD',
      name: 'DEBUG_TX(UART_TXD0)',
      v: 0,
      mode: 'ALT5',
      wPi: 14,
      bcmOrLinuxGpio: 4,
    ),
    PinInformation(
      category: 'Power',
      pinAndPhysicalPinConfiguration: 5,
      gpioColumn: 1,
      gpioValue: '3V3',
      name: 'SYS_3.3V',
    ),
    PinInformation(
      category: 'Power',
      pinAndPhysicalPinConfiguration: 6,
      gpioColumn: 2,
      gpioValue: 'GND',
      name: 'GND',
    ),
    PinInformation(
      category: 'Power',
      pinAndPhysicalPinConfiguration: 7,
      gpioColumn: 1,
      gpioValue: 'GND',
      name: 'GND',
    ),
    PinInformation(
      category: 'GPIO',
      pinAndPhysicalPinConfiguration: 8,
      gpioColumn: 2,
      gpioValue: 'SCL',
      name: 'I2C0_SCL/GPIOA11',
      v: 0,
      mode: 'ALT5',
      wPi: 13,
      bcmOrLinuxGpio: 11,
    ),
    PinInformation(
      category: 'GPIO',
      pinAndPhysicalPinConfiguration: 9,
      gpioColumn: 1,
      gpioValue: 'IRRX',
      name: 'IR-RX ',
      v: 0,
      mode: 'IN',
      wPi: 18,
      bcmOrLinuxGpio: 363,
    ),
    PinInformation(
      category: 'GPIO',
      pinAndPhysicalPinConfiguration: 10,
      gpioColumn: 2,
      gpioValue: 'SDA',
      name: 'I2C0_SDA/GPIOA12',
      v: 0,
      mode: 'ALT4',
      wPi: 3,
      bcmOrLinuxGpio: 13,
    ),
    PinInformation(
      category: 'GPIO',
      pinAndPhysicalPinConfiguration: 11,
      gpioColumn: 1,
      gpioValue: 'PG11',
      name: 'GPIOG11',
      v: 0,
      mode: 'OUT',
      wPi: 16,
      bcmOrLinuxGpio: 203,
    ),
    PinInformation(
      category: 'GPIO',
      pinAndPhysicalPinConfiguration: 12,
      gpioColumn: 2,
      gpioValue: 'CS',
      name: 'UART3_TX/SPI1_CS/GPIOA13',
      v: 0,
      mode: 'ALT4',
      wPi: 3,
      bcmOrLinuxGpio: 13,
    ),
    PinInformation(
      category: 'USB',
      pinAndPhysicalPinConfiguration: 13,
      gpioColumn: 1,
      gpioValue: 'DM3',
      name: 'USB-DM3',
    ),
    PinInformation(
      category: 'GPIO',
      pinAndPhysicalPinConfiguration: 14,
      gpioColumn: 2,
      gpioValue: 'CLK',
      name: 'UART3_RX/SPI1_CLK/GPIOA14',
      v: 0,
      mode: 'ALT4',
      wPi: 2,
      bcmOrLinuxGpio: 14,
    ),
    PinInformation(
      category: 'USB',
      pinAndPhysicalPinConfiguration: 15,
      gpioColumn: 1,
      gpioValue: 'DP3',
      name: 'USB-DP3',
    ),
    PinInformation(
      category: 'GPIO',
      pinAndPhysicalPinConfiguration: 16,
      gpioColumn: 2,
      gpioValue: 'MISO',
      name: 'UART3_CTS/SPI1_MISO/GPIOA16',
      v: 0,
      mode: 'ALT4',
      wPi: 0,
      bcmOrLinuxGpio: 16,
    ),
    PinInformation(
      category: 'USB',
      pinAndPhysicalPinConfiguration: 17,
      gpioColumn: 1,
      gpioValue: 'DM2',
      name: 'USB-DM2',
    ),
    PinInformation(
      category: 'GPIO',
      pinAndPhysicalPinConfiguration: 18,
      gpioColumn: 2,
      gpioValue: 'MOSI',
      name: 'UART3_RTS/SPI1_MOSI/GPIOA15',
      v: 0,
      mode: 'ALT4',
      wPi: 7,
      bcmOrLinuxGpio: 15,
    ),
    PinInformation(
      category: 'USB',
      pinAndPhysicalPinConfiguration: 19,
      gpioColumn: 1,
      gpioValue: 'DP2',
      name: 'USB-DP2',
    ),
    PinInformation(
      category: 'GPIO',
      pinAndPhysicalPinConfiguration: 20,
      gpioColumn: 2,
      gpioValue: 'RX1',
      name: 'UART1_RX/GPIOG7',
      v: 0,
      wPi: 9,
      bcmOrLinuxGpio: 199,
    ),
    PinInformation(
      category: 'EPHY',
      pinAndPhysicalPinConfiguration: 21,
      gpioColumn: 1,
      gpioValue: 'RD-',
      name: 'EPHY-RXN',
    ),
    PinInformation(
      category: 'GPIO',
      pinAndPhysicalPinConfiguration: 22,
      gpioColumn: 2,
      gpioValue: 'TX1',
      name: 'UART1_TX/GPIOG6',
      v: 0,
      mode: 'ALT5',
      wPi: 8,
      bcmOrLinuxGpio: 198,
    ),
    PinInformation(
      category: 'EPHY',
      pinAndPhysicalPinConfiguration: 23,
      gpioColumn: 1,
      gpioValue: 'RD+',
      name: 'EPHY-RXP',
    ),
    PinInformation(
      category: 'CVBS',
      pinAndPhysicalPinConfiguration: 24,
      gpioColumn: 2,
      gpioValue: 'CVBS',
      name: 'CVBS',
    ),
    PinInformation(
      category: 'EPHY',
      pinAndPhysicalPinConfiguration: 25,
      gpioColumn: 1,
      gpioValue: 'TD-',
      name: 'EPHY-TXN',
    ),
    PinInformation(
      category: 'LINEOUT',
      pinAndPhysicalPinConfiguration: 26,
      gpioColumn: 2,
      gpioValue: 'LL',
      name: 'LINEOUT_L',
    ),
    PinInformation(
      category: 'EPHY',
      pinAndPhysicalPinConfiguration: 27,
      gpioColumn: 1,
      gpioValue: 'TD+',
      name: 'EPHY-TXP',
    ),
    PinInformation(
      category: 'LINEOUT',
      pinAndPhysicalPinConfiguration: 28,
      gpioColumn: 2,
      gpioValue: 'LR',
      name: 'LINEOUT_R',
    ),
    PinInformation(
      category: 'EPHY',
      pinAndPhysicalPinConfiguration: 29,
      gpioColumn: 1,
      gpioValue: 'LNK',
      name: 'EPHY-LED-LINK',
    ),
    PinInformation(
      category: 'MIC',
      pinAndPhysicalPinConfiguration: 30,
      gpioColumn: 2,
      gpioValue: 'MP',
      name: 'MIC_P',
    ),
    PinInformation(
      category: 'EPHY',
      pinAndPhysicalPinConfiguration: 31,
      gpioColumn: 1,
      gpioValue: 'SPD',
      name: 'EPHY-LED-SPD',
    ),
    PinInformation(
      category: 'MIC',
      pinAndPhysicalPinConfiguration: 32,
      gpioColumn: 2,
      gpioValue: 'MN',
      name: 'MIC_N',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 1,
      description: 'NC1',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 2,
      description: 'AGND',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 3,
      description: 'SIO-D',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 4,
      description: 'AVDD',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 5,
      description: 'SIO-C',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 6,
      description: 'RESER',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 7,
      description: 'VSYNC',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 8,
      description: 'PWDN',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 9,
      description: 'HREF',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 10,
      description: 'DVDD',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 11,
      description: 'DOVDD',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 12,
      description: 'Y9/MDP1',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 13,
      description: 'XCLK',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 14,
      description: 'Y8/MDN1',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 15,
      description: 'DGND',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 16,
      description: 'Y7/MCP',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 17,
      description: 'PCLK',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 18,
      description: 'Y6/MCN',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 19,
      description: 'Y2',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 20,
      description: 'Y5/MDP0',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 21,
      description: 'Y3',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 22,
      description: 'Y4/MDN0',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 23,
      description: 'AF-VDD',
    ),
    PinInformation(
      category: 'Camera（OV5640',
      pinAndPhysicalPinConfiguration: 24,
      description: 'NC2',
    ),
  ];

  /// Gpio pins number (pinAndPhysicalPinConfiguration) to
  /// hand out before the original order
  List<int> freeGpioPinsToUseFirst = <int>[8, 10, 12, 14];

  @override
  PinInformation getNextFreeGpioPin({List<PinInformation?>? ignorePinsList}) {
    for (final int pinNumber in freeGpioPinsToUseFirst) {
      final PinInformation tempPinInformation =
          PinInformation(pinAndPhysicalPinConfiguration: pinNumber);

      final PinInformation pinInformationExistInList =
          doesPinExistInPinList(tempPinInformation, pinList)!;

      if (isGpioPinFree(pinNumber) >= 0 &&
          doesPinExistInPinList(pinInformationExistInList, ignorePinsList) ==
              null) {
        return pinInformationExistInList;
      }
    }
    return getNextFreeGpioPinHelper(pinList!, ignorePinsList: ignorePinsList)!;
  }
}
