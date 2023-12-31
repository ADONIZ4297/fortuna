import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortuna/service/extension.dart';

String sToEnglsh(int num) {
  switch (num) {
    case 1:
      return "a";
    case 2:
      return "b";
    case 3:
      return "c";
    case 4:
      return "d";
    case 5:
      return "e";
    case 6:
      return "f";
    case 7:
      return "g";
    case 8:
      return "h";
    case 9:
      return "i";
    case 0:
      return "j";
    default:
      return "j";
  }
}

String tToEnglsh(int num) {
  switch (num) {
    case 1:
      return "k";
    case 2:
      return "l";
    case 3:
      return "m";
    case 4:
      return "n";
    case 5:
      return "o";
    case 6:
      return "p";
    case 7:
      return "q";
    case 8:
      return "r";
    case 9:
      return "s";
    case 10:
      return "t";
    case 11:
      return "u";
    case 12:
      return "v";
    default:
      return "v";
  }
}

Color eToColor(String? e) {
  switch (e) {
    case 'a':
    case 'b':
    case 'm':
    case 'n':
      return HexColor("#3542BD");
    case 'c':
    case 'd':
    case 'p':
    case 'q':
      return HexColor("#F24545");
    case 'e':
    case 'f':
    case 'l':
    case 'o':
    case 'r':
    case 'u':
      return HexColor("#F5C242");
    case 'g':
    case 'h':
    case 's':
    case 't':
      return Colors.white;
    case 'i':
    case 'j':
    case 'k':
    case 'v':
      return HexColor("#404040");
    default:
      return Colors.black;
  }
}

String eToChinese(String? e) {
  // return e.toString();
  switch (e) {
    case "a":
      return "甲";
    case 'b':
      return "乙";
    case 'c':
      return "丙";
    case 'd':
      return "丁";
    case 'e':
      return "戊";
    case 'f':
      return "己";
    case 'g':
      return "庚";
    case 'h':
      return "辛";
    case 'i':
      return "壬";
    case 'j':
      return "癸";
    case 'k':
      return "子";
    case 'l':
      return "丑";
    case 'm':
      return "寅";
    case 'n':
      return "卯";
    case 'o':
      return "辰";
    case 'p':
      return "巳";
    case 'q':
      return "午";
    case 'r':
      return "未";
    case 's':
      return "申";
    case 't':
      return "酉";
    case 'u':
      return "戌";
    case 'v':
      return "亥";
    case null:
      return "";
    default:
      return "";
  }
}
