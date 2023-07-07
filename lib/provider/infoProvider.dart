import 'package:fortuna/service/enum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Info {
  int year;
  int month;
  int day;
  int hour;
  int minuite;
  DateTime date;
  Gender gender;
  bool isLunar;
  String name;
  String phone;
  String email;
  Info(this.date, this.year, this.month, this.day, this.hour, this.minuite, this.gender, this.isLunar, this.name,
      this.phone, this.email);
}

final infoProvider = StateProvider<Info?>((ref) {
  return null;
});
