import 'dart:math';

import 'package:intl/intl.dart';


const _charsAlpha = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
const _charsNumeric = '1234567890';
Random _rnd = Random();

String getRandomAlphaString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _charsAlpha.codeUnitAt(_rnd.nextInt(_charsAlpha.length))));

String getRandomNumericString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _charsNumeric.codeUnitAt(_rnd.nextInt(_charsNumeric.length))));

String getAlphaNumericString(){
  var alphaNumeric = getRandomAlphaString(4).toUpperCase()+getRandomNumericString(3);
  return alphaNumeric;
}


dateConverter(String date) {
  DateTime parsedDate = DateTime.parse(date.toString());
  final DateFormat formatter = DateFormat('dd MMMM yyyy ,h:mm a');
  final String formatted = formatter.format(parsedDate);
  return formatted;
}