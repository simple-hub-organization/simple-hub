import 'dart:convert';

/// Class to include all the functions that exist in util.py in aioesphomeapi
class EspHomeUtil {
  /// aioesphomeapi:
  /// fName = varuint_to_bytes
  /// TODO: Check if this is working
  static List<int> varuintToBytes(int value) {
    if (value <= 0x7F) {
      return <int>[value];
    }

    final List<int> bytes = [];
    for (int byte in utf8.encode(value.toString())) {
      final int temp = byte & 0x7F;
      byte >>= 7;
      if (!byte.isNaN) {
        bytes.add(temp | 0x80);
      } else {
        bytes.add(temp);
      }
    }
    return bytes;
  }

  /// aioesphomeapi:
  /// fName = bytes_to_varuint
  /// TODO: Check if this is working
  static int? bytesToVaruint(List<int> value) {
    int result = 0;
    int bitPos = 0;

    for (final int val in value) {
      result |= (val & 0x7F) << bitPos;
      bitPos += 7;
      if ((val & 0x80) == 0) {
        return result;
      }
    }
    return null;
  }

  // /// aioesphomeapi:
  // /// fName = fix_float_single_double_conversion
  // /// Fix precision for single-precision floats and return what was probably
  // /// meant as a float.
  // ///
  // /// In ESPHome we work with single-precision floats internally for performance.
  // /// But python uses double-precision floats, and when protobuf reads the message
  // /// it's auto-converted to a double (which is possible losslessly).
  // ///
  // /// Unfortunately the float representation of 0.1 converted to a double is not the
  // /// double representation of 0.1, but 0.10000000149011612.
  // ///
  // /// This methods tries to round to the closest decimal value that a float of this
  // /// magnitude can accurately represent.
  // ///
  // /// TODO: Check if this is working
  // static int fixFloatSingleDoubleConversion(int value) {
  //   if(value == 0 || ! value.isFinite){
  //     return value;
  //   }
  //   int absVal = value.abs();
  //
  //   # assume ~7 decimals of precision for floats to be safe
  //   l10 = math.ceil(math.log10(abs_val))
  //   prec = 7 - l10
  //   return round(value, prec)
  // }
}
