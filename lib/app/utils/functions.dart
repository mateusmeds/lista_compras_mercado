import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

showSuccessMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: Colors.green,
  ));
}

showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
  ));
}

String currencyFormatBRL(double value) {
  var format = NumberFormat.currency(symbol: 'R\$', locale: 'pt_BR');
  return format.format(value);
}

String dateFormatBR(DateTime date) {
  var formatDate = DateFormat('dd/MM/y');
  return formatDate.format(date);
}

String timeFormatBR(DateTime date) {
  var formatTime = DateFormat('hh:mm');
  return formatTime.format(date);
}

String dateTimeFormatBR(DateTime date) {
  return '${dateFormatBR(date)} às ${timeFormatBR(date)}';
}
