import 'package:intl/intl.dart';

dateFormat(String date){
  if(date==null || date.isEmpty){
    return '';
  }
  DateTime dt = DateTime.parse(date);
  final DateFormat format = DateFormat('dd MMMM,y ');
  final String formatted = format.format(dt);
  return formatted;
}
