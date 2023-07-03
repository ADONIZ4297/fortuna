import 'dart:convert';

import 'package:fortuna/provider/infoProvider.dart';
import 'package:fortuna/service/graph.dart';
import 'package:fortuna/service/extension.dart';
import 'package:fortuna/service/numberToEnglish.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:lunar/calendar/Lunar.dart';

class Fortune {
  late final DateTime date;
  late final int year;
  late final int month;
  late final int day;
  late final int hour;
  late final int minutes;
  late String s;
  late String t;
  late String v;
  late String u;
  late String p;
  late String q;
  late String a;
  late String b;
  late List<String> graph1;
  late List<List> graph3;
  late List<String> graph5;
  late List<List> graph6 = [[], [], [], []];

  Fortune(Info info) {
    year = info.year;
    month = info.month;
    day = info.day;
    hour = info.hour;
    minutes = info.minuite;
    date = DateTime(info.year, info.month, info.day, info.hour, info.minuite);
    //년의 간지
    s = sToEnglsh((info.year + 7) % 10);
    t = tToEnglsh((info.year + 9) % 12);
    //월의 간지
    v = sToEnglsh((2 * info.year + info.month + 3) % 10);
    u = tToEnglsh((info.month + 1) % 12);
    //일의 간지
    calcDay();
    calcTime();
    calcGraph1();
    // calcGraph2();
    calcGraph3();
    calcGraph5();
    calcGraph6();
    // int p = (4*c+[c/4]+5n+[n/4]+[(3m+3)/5]+d+7)%10;
  }

  void calcGraph1() {
    graph1 = [
      table1List[table1[p]!.split('').indexWhere((element) => element == a)],
      "*",
      table1List[table1[p]!.split('').indexWhere((element) => element == v)],
      table1List[table1[p]!.split('').indexWhere((element) => element == s)],
    ];
  }

  void calcGraph5() {
    graph5 = [
      table5List[table5[p]!.split('').indexWhere((element) => element == b)],
      table5List[table5[p]!.split('').indexWhere((element) => element == q)],
      table5List[table5[p]!.split('').indexWhere((element) => element == u)],
      table5List[table5[p]!.split('').indexWhere((element) => element == t)],
    ];
  }

  void calcGraph6() {
    // print(p);
    // print(table6[p]);
    // print(q);
    var list = [b, q, u, t];
    print(u);
    print(list);
    for (var j = 0; j < 4; j++) {
      for (var i = 0; i < table6_1[p]!.length; i++) {
        if (table6_1[p]![i].contains(list[j])) {
          graph6[j].add(table6_1List[i]);
        }
      }
      for (var i = 0; i < table6_2[p]!.length; i++) {
        if (table6_2[p]![i].contains(list[j])) {
          graph6[j].add(table6_2List[i]);
        }
      }
    }
    //표 6-3

    [a, b, p, q, v, s, t].forEach((element) {
      for (var i = 0; i < 4; i++) {
        if (table6_3[u]!.split('')[i] == element) {
          graph6[2].add(table6_3List[i]);
        }
      }
    });
    //표 6-4
    if ([a, p, q, v, u, s, t].indexWhere((element) => element == table6_4[b]) != -1) {
      graph6[0].add("화개");
    }
    if ([a, p, b, v, u, s, t].indexWhere((element) => element == table6_4[q]) != -1) {
      graph6[1].add("화개");
    }
    //표 6-5
    graph6[0].add(table6_5List[table6_5[q]!.split('').indexWhere((element) => element == b)]);
    graph6[2].add(table6_5List[table6_5[q]!.split('').indexWhere((element) => element == u)]);
    graph6[3].add(table6_5List[table6_5[q]!.split('').indexWhere((element) => element == t)]);

    //표 6-6
    // print(table6List[table6['b']!.indexWhere((element) => element.contains('u'))]);
    print(graph6);
  }

  void calcGraph2() async {
    // graph3Table[b]!.keys;

    var uri = Uri.http('apis.data.go.kr', '/B090041/openapi/service/SpcdeInfoService/get24DivisionsInfo', {
      // "solYear": year.toString(),
      "solYear": "1972",
      "solMonth": "04",
      "_type": 'json',
      "ServiceKey": 'LeI/gxYl59kl1uxTdC3NPxkzk5UkLRKaF35z8CjN5XgxwIPwhYl9n+jR8LR+8rKLa6tsw/qOArBE2cH1saRJoA==',
    });

    var result = await get(uri);

    List items = jsonDecode(result.body)['response']['body']['items']['item'] as List;
    List<int> list = [];
    for (var item in items) {
      list.add(item['locdate']);
    }

    var date;
    for (var i = 0; i < list.length; i++) {
      if (20220812 < list[i]) {
        date = list[i - 1];
        break;
      }
    }
  }

  void calcGraph3() {
    // var lunar = Lunar.fromDate(DateTime(year, month, day));
    graph3 = [
      ...[table3[b]!.values.toList()],
      ...[table3[q]!.values.toList()],
      ...[table3[u]!.values.toList()],
      ...[table3[t]!.values.toList()],
    ];
  }

  void calcDay() {
    var newY = year;
    var newM = month;
    if (month == 1 || month == 2) {
      newY -= 1;
    }
    if (month == 1) {
      newM = 13;
    }
    if (month == 2) {
      newM = 14;
    }
    int c = int.parse(newY.toString().substring(0, 2));
    int n = int.parse(newY.toString().substring(2));
    var numP = (4 * c + (c / 4).floor() + 5 * n + (n / 4).floor() + ((3 * newM + 3) / 5).floor() + day + 7) % 10;
    p = sToEnglsh(numP);

    q = tToEnglsh(
        (8 * c + (c / 4).floor() + 5 * n + (n / 4).floor() + 6 * newM + ((3 * newM + 3) / 5).floor() + day + 1) % 12);
  }

  void calcTime() {
    late int row;
    late int column;
    var myMinuite = hour * 60 + minutes;
    switch (p) {
      case "a":
      case "f":
        column = 0;
      case "b":
      case "g":
        column = 1;
      case "c":
      case "h":
        column = 2;
      case "d":
      case "i":
        column = 3;
      case "e":
      case "j":
        column = 4;
      default:
    }

    if (myMinuite > 30 && myMinuite < 90) {
      row = 0;
    } else if (myMinuite < 210) {
      row = 1;
    } else if (myMinuite < 330) {
      row = 2;
    } else if (myMinuite < 450) {
      row = 3;
    } else if (myMinuite < 570) {
      row = 4;
    } else if (myMinuite < 690) {
      row = 5;
    } else if (myMinuite < 810) {
      row = 6;
    } else if (myMinuite < 930) {
      row = 7;
    } else if (myMinuite < 1050) {
      row = 8;
    } else if (myMinuite < 1170) {
      row = 9;
    } else if (myMinuite < 1290) {
      row = 10;
    } else if (myMinuite < 1410) {
      row = 11;
    } else {
      row = 12;
    }

    a = dayGraph[row][column].substring(0, 1);
    b = dayGraph[row][column].substring(1);
  }
}

final fortuneProvider = Provider<Fortune?>((ref) {
  Info? info = ref.watch(infoProvider);
  if (info == null) {
    return null;
  }
  return Fortune(info);
});
