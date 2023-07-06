import 'dart:io';

import 'package:excel/excel.dart';
import 'package:lunar/calendar/Lunar.dart';

void main() async {
  var lunar = Lunar.fromDate(DateTime.now());
  print(lunar.getYear());
  print(lunar.getMonth());
  print(lunar.getDay());
  // var date = DateTime.parse('190006061215');
  // print(date);
  // var string = "m	n	o	p	q	r	s	t	u	v	k	l";
  // var newArray = [];

  // var array = string.split('	');

  // array.forEach((element) {
  //   newArray.add("'" + element + "'");
  // });
  // print(newArray);
}
