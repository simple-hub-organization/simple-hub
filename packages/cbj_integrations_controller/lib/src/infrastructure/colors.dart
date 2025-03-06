// TODO: Replace reference to this file when there is a package for dart native
// TODO: that let us choose colors like in flutter `orange`
// TODO: Created a issue for that in one of the packages
// TODO: https://github.com/material-foundation/material-color-utilities/issues/63

enum Colors {
  orange('0xFFFF9800'),
  orangeAccent('0xFFFFAB40'),
  deepOrange('0xFFFF5722'),
  deepOrangeAccent('0xFFFF6E40'),
  amber('0xFFFFC107'),
  amberAccent('0xFFFFD740'),
  blue('0xFF2196F3'),
  blueAccent('0xFF448AFF'),
  lightBlue('0xFF03A9F4'),
  lightBlueAccent('0xFF40C4FF'),
  blueGrey('0xFF607D8B'),
  grey('0xFF9E9E9E'),
  red('0xFFF44336'),
  redAccent('0xFFFF5252'),
  black('0xFF000000'),
  brown('0xFF795548'),
  cyan('0xFF00BCD4'),
  cyanAccent('0xFF18FFFF'),
  deepPurple('0xFF673AB7'),
  deepPurpleAccent('0xFF7C4DFF'),
  green('0xFF4CAF50'),
  greenAccent('0xFF69F0AE'),
  lightGreen('0xFF8BC34A'),
  lightGreenAccent('0xFFB2FF59'),
  indigo('0xFF3F51B5'),
  indigoAccent('0xFF536DFE'),
  pink('0xFFE91E63'),
  pinkAccent('0xFFFF4081'),
  purple('0xFF9C27B0'),
  purpleAccent('0xFFE040FB'),
  teal('0xFF009688'),
  tealAccent('0xFF64FFDA'),
  transparent('0xFF000000'),
  yellow('0xFFFFEB3B'),
  yellowAccent('0xFFFFFF00'),
  white('0xFFFFFFFF'),
  white12('0x1FFFFFFF'),
  ;

  const Colors(this.value);

  final String value;
}
