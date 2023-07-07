import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/service/button.dart';
import 'package:fortuna/service/color.dart';
import 'package:fortuna/service/extension.dart';
import 'package:styled_widget/styled_widget.dart';

Future<bool?> showModal(BuildContext context, String title, String content) async {
  return await showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: HexColor("#262626"),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        height: 300,
        width: double.infinity,
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(text).fontSize(22).fontWeight(FontWeight.w500),
              // Expanded(
              //   child: TimePickerSpinner(
              //     is24HourMode: false,
              //   ),
              // ),
              Spacer(),
              Text(title).fontSize(24).bold(),
              Spacer(),
              Text(content).fontSize(16).textColor(gray),
              Spacer(),
              Row(
                children: [
                  Button(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                      ),
                      child: const Text("아니요").bold().fontSize(16).textColor(Colors.white).center().padding(all: 10),
                    ),
                    // text: "완료",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ).expanded(),
                  const SizedBox(width: 20),
                  Button(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("네").bold().fontSize(16).textColor(Colors.black).center().padding(all: 10),
                    ),
                    // text: "완료",
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ).expanded(),
                ],
              )
            ],
          ).padding(all: 30),
        ),
      );
    },
  );
}

Future<DateTime?> showTimeModal(BuildContext context, DateTime dateTime, bool use24) async {
  return await showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return TimeModal(dateTime: dateTime, use24: use24);
    },
  );
}

class TimeModal extends StatelessWidget {
  TimeModal({super.key, required this.dateTime, required this.use24});
  DateTime dateTime;
  bool use24;

  @override
  Widget build(BuildContext context) {
    // DateTime? time;
    return Container(
      decoration: BoxDecoration(
        color: HexColor("#262626"),
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      height: 400,
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(text).fontSize(22).fontWeight(FontWeight.w500),
            Expanded(
              child: CupertinoTheme(
                data: const CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(color: Colors.white),
                  ),
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: dateTime,
                  use24hFormat: use24,
                  minuteInterval: 1,
                  onDateTimeChanged: (value) {
                    dateTime = value;
                  },
                ),
              ),
            ),
            // Expanded(
            //   child: TimePickerSpinner(
            //     is24HourMode: false,
            //   ),
            // ),
            Button(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("완료").bold().fontSize(16).textColor(Colors.black).center().padding(all: 10),
              ),
              // text: "완료",
              onPressed: () {
                Navigator.pop(context, dateTime);
              },
            )
          ],
        ).padding(all: 30),
      ),
    );
  }
}
