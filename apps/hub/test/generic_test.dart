import 'package:test/test.dart';

void main() {
  test('DST example Test 2', () {
    final DateTime today = DateTime(2020, 3, 8);
    final DateTime tomorrow = DateTime(2020, 3, 9);
    final diff = tomorrow.difference(today);
    final int days = diff.inDays;
    expect(days, 1);
  });
}
