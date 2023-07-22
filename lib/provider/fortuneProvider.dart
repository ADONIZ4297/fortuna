import 'dart:convert';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:fortuna/provider/infoProvider.dart';
import 'package:fortuna/provider/solarDatesProvider.dart';
import 'package:fortuna/service/enum.dart';
import 'package:fortuna/service/graph.dart';
import 'package:fortuna/service/extension.dart';
import 'package:fortuna/service/numberToEnglish.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:klc/klc.dart';
import 'package:lunar/calendar/Lunar.dart';
import 'package:collection/collection.dart';

class Fortune {
  late final DateTime date;
  late final DateTime lunarDate;
  late final int year;
  late final int month;
  late final int day;
  late final int hour;
  late final int minutes;
  late final Gender gender;
  late final bool reverse;
  late String s;
  late String t;
  late String v;
  late String u;
  late String p;
  late String q;
  late String a;
  late String b;
  late List<String> graph1;
  late List<String> graph2;
  late List<List> graph3;
  late String graph4_1 = "";
  late String graph4_2;
  late List<String> graph5;
  late List<List> graph6 = [[], [], [], []];
  late List<String> graph7 = [];
  late String graph8;
  late String graph9;
  late String graph10;
  late List<String> graph11;
  late List<String> graph12;
  late String graph13;
  late List<List<String>> graph14;
  late List<String> graph15;
  late List<String> graph16;
  late List<DateTime> solarDates;
  late DateTime solarDate;
  late DateTime solarDate2;

  Fortune(Info info, List<DateTime> dates) {
    year = info.date.year;
    month = info.date.month;
    day = info.date.day;
    hour = info.date.hour;
    minutes = info.date.minute;
    gender = info.gender;
    date = info.date;
    if (info.isLunar) {
      lunarDate = date;
    } else {
      var lunar = Lunar.fromDate(date);
      lunarDate = DateTime(lunar.getYear(), lunar.getMonth(), lunar.getDay(), lunar.getHour(), lunar.getMinute());
    }

    var index = dates.indexWhere((element) => element.isAfter(lunarDate));
    solarDate = dates[index - 1];
    solarDate2 = dates[index];

    //년의 간지
    s = sToEnglsh((year + 7) % 10);
    t = tToEnglsh((year + 9) % 12);
    //월의 간지
    v = sToEnglsh((2 * year + month + 3) % 10);
    u = tToEnglsh((month + 1) % 12);
    //일의 간지
    calcDay();
    calcTime();
    // //역운 순운
    if (p == 'a' || p == 'c' || p == 'e' || p == 'g' || p == 'i') {
      if (gender == Gender.male) {
        reverse = false;
      } else {
        reverse = true;
      }
    } else {
      if (gender == Gender.male) {
        reverse = true;
      } else {
        reverse = false;
      }
    }

    calcGraph1();
    calcGraph2();
    calcGraph3();
    calcGraph4();
    calcGraph5();
    calcGraph6();
    calcGraph7();
    calcGraph8();
    calcGraph9();
    calcGraph10();
    calcGraph11();
    calcGraph13();
    calcGraph14();
    calcGraph15();
    calcGraph16();
    calcGraph12();
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
    var list = [b, q, u, t];

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
    // //표 6-5

    for (var i = 0; i < 13; i++) {
      if (table6_5[q]!.split('')[i] == b) {
        graph6[0].add(table6_5List[i]);
      }
    }
    for (var i = 0; i < 13; i++) {
      if (table6_5[q]!.split('')[i] == u) {
        graph6[2].add(table6_5List[i]);
      }
    }
    for (var i = 0; i < 13; i++) {
      if (table6_5[q]!.split('')[i] == t) {
        graph6[3].add(table6_5List[i]);
      }
    }

    // //표 6-6

    if (['io', 'go', 'gu', 'eu'].indexWhere((element) => element == p + q) != -1) {
      graph6[1].add("괴강");
    }
    if (['ao', 'bp', 'is', 'dv', 'go', 'eu', 'hp', 'jv', 'fl'].indexWhere((element) => element == p + q) != -1) {
      graph6[1].add("십악대살");
    }
    var list2 = [a + b, p + q, v + u, s + t];
    for (var i = 0; i < 4; i++) {
      if (['eo', 'dl', 'cu', 'br', 'ao', 'ji', 'iu'].indexWhere((element) => element == list2[i]) != -1) {
        graph6[i].add("백호대살");
      }
    }

    var tang = {
      'l': ['q', 'r', 'u'],
      'm': ['s', 'p'],
      'q': ['l', 'o', 'q'],
    };
    var bq = {
      b: ['a', 'p', 'q', 'v', 'u', 's', 't'],
      q: ['a', 'p', 'b', 'v', 'u', 's', 't'],
    };
    var k = 0;
    for (var map in bq.entries) {
      if (tang[map.key] != null) {
        if (map.value.where((element) => tang[map.key]!.contains(element)).isNotEmpty) {
          graph6[k].add('탕화살');
        }
      }
      k += 1;
    }
  }

  void calcGraph7() {
    for (var map in table7.entries) {
      if (map.key.where((element) => element == p + q).isNotEmpty) {
        graph7 = map.value;
      }
    }
  }

  void calcGraph8() {
    graph8 = table8[p]!;
  }

  void calcGraph9() {
    if (gender == Gender.male) {
      graph9 = table9[t]![0];
    } else {
      graph9 = table9[t]![1];
    }
  }

  void calcGraph10() {
    var kv = ['k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v'];
    var ml = ['m', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'k', 'l'];

    graph10 = table10[kv.indexWhere((element) => element == q)][ml.indexWhere((element) => element == u)];
  }

  void calcGraph11() {
    var index = table11B.indexWhere((element) => element == u);
    graph11 = [table11[table11A[p]![0]][index], table11[table11A[p]![1]][index]];
  }

  void calcGraph12() {
    print("calcGraph12");
    // ["a", "b", "m", "n"];
    print(graph3);
    var newGraph3 = List.from(graph3.expand((element) => [...element]))..removeWhere((element) => element == null);
    var newGraph14 = List.from(graph14.expand((element) => [...element]))..removeWhere((element) => element == null);
    print(newGraph3);
    List<String> list = [
      a,
      b,
      p,
      q,
      v,
      u,
      s,
      t,
      ...newGraph3,
      ...newGraph14,
    ];
    graph12 = [];
    print(list);
    var minusPlus = [
      ["a", "b", "m", "n"],
      ["c", "d", "q", "p"],
      ["e", "f", "o", "u", "l", 'r'],
      ["g", "h", "s", "t"],
      ["i", "j", "k", "v"],
    ];
    for (var aaa in minusPlus) {
      var where = list.where((element) => aaa.contains(element));
      print(where);
      graph12.add(where.length.toString());
    }
    print(graph12);
  }

  void calcGraph13() {
    if (reverse) {
      var inHours = lunarDate.difference(solarDate).inHours;
      var inDays = lunarDate.difference(solarDate).inDays;

      if (inHours % 72 >= 36) {
        inDays += 1;
      }
      graph13 = inDays.toString();

      // if (lunarDate.difference(solarDate).inHours % 24 >= 12) {
      //   inDays += 1;
      // }
    } else {
      var inHours = solarDate2.difference(lunarDate).inHours;
      var inDays = solarDate2.difference(lunarDate).inDays;
      if (inHours % 72 >= 36) {
        inDays += 1;
      }
      graph13 = inDays.toString();
    }
  }

  void calcGraph14() {
    graph14 = [
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      [v, u],
    ];
    var aa = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];
    var bb = ['m', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'k', 'l'];
    if (reverse) {
      aa = aa.reversed.toList();
      bb = bb.reversed.toList();
    }
    var index1 = aa.indexWhere((element) => element == v);
    var index2 = bb.indexWhere((element) => element == u);
    for (var i = 0; i < 10; i++) {
      if (index1 + 1 >= aa.length) {
        index1 = 0;
      } else {
        index1 += 1;
      }
      if (index2 + 1 >= bb.length) {
        index2 = 0;
      } else {
        index2 += 1;
      }
      graph14[i] = [aa[index1], bb[index2]];
    }
  }

  void calcGraph15() {
    graph15 = [''];
    for (var i = 0; i < 10; i++) {
      graph15.add(table1List[table1[graph14[i][0]]!.split('').indexWhere((element) => element == graph14[i + 1][0])]);
    }
  }

  void calcGraph16() {
    graph16 = [''];
    for (var i = 0; i < 10; i++) {
      // print(
      //   table5[graph14[i][0]]!.split('').indexWhere((element) => element == graph14[i + 1][1]),
      // );
      // print(table5[graph14[i][0]]!.split(''));
      // print(table5[graph14[i][1]]!.split(''));
      // graph16.add(table5List[table1[graph14[i][0]]])
      graph16.add(table5List[table5[graph14[i][0]]!.split('').indexWhere((element) => element == graph14[i + 1][1])]);
    }
  }

  void calcGraph2() async {
    var difference = lunarDate.difference(solarDate).inHours;
    graph2 = [];
    [b, q, u, t].forEach((element) {
      Map<int, int> map = {};
      for (var i = 0; i < table3[element]!.keys.length; i++) {
        int? key = table3[element]!.keys.toList()[i];
        if (key != null) {
          map[i] = key;
        }
      }

      var sortedByKeyMap = Map.fromEntries(map.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
      var index = sortedByKeyMap.entries.toList().indexWhere((element) => element.value > difference);

      graph2.add(table3[element]?[sortedByKeyMap.entries.toList()[index].value] ?? "");
      if (element == u) {
        if (sortedByKeyMap.entries.toList()[index].key == 0) {
          graph4_1 = "초";
        } else if (sortedByKeyMap.entries.toList()[index].key == 1) {
          graph4_1 = "중";
        } else {
          graph4_1 = "정";
        }
      }
    });
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

  void calcGraph4() {
    var dif = lunarDate.difference(solarDate).inMinutes;
    var day = (dif / 1440).floor();
    var hour = ((dif - (1440 * day)) / 60).floor();
    var minuite = dif - (hour * 60 + day * 1440);
    graph4_2 = "$day일 $hour시간 $minuite분";
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
  return Fortune(info, ref.watch(solarDatesProvider).dates);
});
