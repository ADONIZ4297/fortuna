import 'dart:convert';

import 'package:http/http.dart';
import 'package:lunar/calendar/Lunar.dart';

void main() async {
  var string = '역마	함지	월살	망신	장성	반안	천살	지살	재살	겁살	조문	조객	혈도';

  var array = string.split('	');
  var newArray = [];
  array.forEach((element) {
    newArray.add("'" + element + "'");
  });
  print(newArray);
  // var uri = Uri.http('apis.data.go.kr', '/B090041/openapi/service/SpcdeInfoService/get24DivisionsInfo', {
  //   "solYear": '2022',
  //   "solMonth": '08',
  //   "_type": 'json',
  //   "ServiceKey": 'LeI/gxYl59kl1uxTdC3NPxkzk5UkLRKaF35z8CjN5XgxwIPwhYl9n+jR8LR+8rKLa6tsw/qOArBE2cH1saRJoA==',
  // });

  // var result = await get(uri);
  // List items = jsonDecode(result.body)['response']['body']['items']['item'] as List;
  // List<int> list = [];
  // for (var item in items) {
  //   // print(item['locdate']);
  //   list.add(item['locdate']);
  // }

  // var date;
  // for (var i = 0; i < list.length; i++) {
  //   if (20220812 < list[i]) {
  //     date = list[i - 1];
  //     break;
  //   }
  // }
  // print(date);
  // print(Lunar.fromDate(DateTime(2001, 4, 17)));
  // print(Lunar.fromYmd(2001, 4, 17).getSolar());
}
