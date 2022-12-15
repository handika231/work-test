import 'package:intl/intl.dart';

extension NumberFormatExtension on num {
  String get toRupiah => NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp ',
        decimalDigits: 0,
      ).format(this);
}

extension ImagePath on String {
  String get toPNG => 'assets/$this.png';
}
