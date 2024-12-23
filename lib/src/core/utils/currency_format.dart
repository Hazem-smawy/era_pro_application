import 'package:intl/intl.dart';

String currencyFormat({required String number}) {
  return NumberFormat.currency(symbol: '', decimalDigits: 1)
      .format(double.parse(number));
}
