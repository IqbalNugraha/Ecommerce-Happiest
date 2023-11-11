import 'package:intl/intl.dart';

extension StringExt on String {
  String get stringCurrencyFormatRp => NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp. ',
        decimalDigits: 0,
      ).format(this);
}

extension IntExt on int {
  String get intCurrencyFormatRp => NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp. ',
        decimalDigits: 0,
      ).format(this);
}
