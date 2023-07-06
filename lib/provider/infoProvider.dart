import 'package:fortuna/service/enum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Info {
  int year;
  int month;
  int day;
  int hour;
  int minuite;
  Gender gender;
  Info(this.year, this.month, this.day, this.hour, this.minuite, this.gender);
}

final infoProvider = StateProvider<Info?>((ref) {
  return null;
});
