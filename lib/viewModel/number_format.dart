import 'package:intl/intl.dart';

class NumberFormatter {
  String number = '';

  String formatNumber(numberNotFormat) {
    NumberFormat formatador = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
      decimalDigits: 2,
    );

    return number = formatador.format(numberNotFormat);
  }
}
