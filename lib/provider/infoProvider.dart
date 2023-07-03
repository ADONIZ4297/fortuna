import 'package:hooks_riverpod/hooks_riverpod.dart';

class Info {
  int year;
  int month;
  int day;
  int hour;
  int minuite;
  Info(this.year, this.month, this.day, this.hour, this.minuite);
}

final infoProvider = StateProvider<Info?>((ref) {
  return null;
});
