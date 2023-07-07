import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SolarDates {
  List<DateTime> dates = [];
  SolarDates() {
    getDates();
  }

  getDates() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "excel.xlsx");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "excel.xlsx"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    var bytes = File(path).readAsBytesSync();
    Excel excel = Excel.decodeBytes(bytes);

    for (var row in excel.tables["Sheet1"]!.rows) {
      var string = row[2]!.value.toString();

      var year = int.parse(string.substring(0, 4));
      var month = int.parse(string.substring(4, 6));
      var day = int.parse(string.substring(6, 8));
      var hour = int.parse(string.substring(8, 10));
      var minuite = int.parse(string.substring(10, 12));
      dates.add(DateTime(year, month, day, hour, minuite));
    }

    // var db = await openDatabase(path, readOnly: true);

    // print(db.database);
  }
}

final solarDatesProvider = Provider<SolarDates>((ref) {
  return SolarDates();
});
