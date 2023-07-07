import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fortuna/provider/fortuneProvider.dart';
import 'package:fortuna/provider/infoProvider.dart';
import 'package:fortuna/provider/solarDatesProvider.dart';
import 'package:fortuna/screen/fortune/fortuneScreen.dart';
import 'package:fortuna/service/button.dart';
import 'package:fortuna/service/color.dart';
import 'package:fortuna/service/enum.dart';
import 'package:fortuna/service/extension.dart';
import 'package:fortuna/service/modalPopup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:path/path.dart';

final formKey = GlobalKey<FormState>();

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nameController = useTextEditingController();
    var birthController = useTextEditingController();
    var phoneController = useTextEditingController();
    var emailController = useTextEditingController();
    var isLunar = useState(false);
    var dateTime = useState<DateTime?>(null);
    var noDate = useState(false);
    var gender = useState(Gender.male);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          '로고',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textfield("이름", "홍길동", nameController),
              const SizedBox(height: 40),
              textfield("생년월일", "19921102", birthController),
              const SizedBox(height: 10),
              checkbox(isLunar, context),
              const SizedBox(height: 20),
              Row(
                children: [
                  Button(
                    onPressed: () {
                      gender.value = Gender.male;
                    },
                    child: Text("남자")
                        .textColor(gender.value != Gender.male ? Colors.white.withOpacity(0.6) : Colors.black)
                        .fontSize(16)
                        .bold()
                        .padding(all: 10)
                        .center()
                        .decorated(
                          color: gender.value == Gender.male ? Colors.white : Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                  ).expanded(),
                  Button(
                    onPressed: () {
                      gender.value = Gender.female;
                    },
                    child: Text("여자")
                        .textColor(gender.value == Gender.male ? Colors.white.withOpacity(0.6) : Colors.black)
                        .fontSize(16)
                        .bold()
                        .padding(all: 10)
                        .center()
                        .decorated(
                          color: gender.value != Gender.male ? Colors.white : Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                  ).expanded(),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("출생시간").fontSize(15).bold(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("한국").bold().fontSize(16),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                          color: HexColor("#262626"),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Button(
                          child: dateTime.value == null
                              ? Text(DateFormat("aa hh:mm").format(DateTime(2023, 7, 7)))
                                  .textColor(Colors.white.withOpacity(0.2))
                                  .fontSize(16)
                                  .bold()
                              : Text(DateFormat("aa hh:mm").format(dateTime.value!)).fontSize(16).bold(),
                          onPressed: () async {
                            var tempDate = await showTimeModal(context, dateTime.value ?? DateTime(2023, 7, 7), false);
                            if (tempDate != null) {
                              dateTime.value = tempDate;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.4), thickness: 1.5),
                  const SizedBox(height: 10),
                  if (!noDate.value && dateTime.value != null) ...[
                    Row(
                      children: [
                        const Text("일본").bold().fontSize(16),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            child: Text(DateFormat("aa hh:mm").format(dateTime.value!)).fontSize(16).bold()),
                      ],
                    ),
                    Divider(color: Colors.white.withOpacity(0.4), thickness: 1.5),
                  ],
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Theme(
                          data: ThemeData(unselectedWidgetColor: const Color(0xff262626)),
                          child: Checkbox(
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            value: (noDate.value),
                            onChanged: (value) {
                              // reverse.value = true;
                              noDate.value = !noDate.value;
                              if (noDate.value) {
                                dateTime.value = null;
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text("태어난 시간 모름"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(CupertinoIcons.info_circle, color: gray, size: 13),
                      const SizedBox(width: 2),
                      Text("시간은 일본시각 기준으로 변환됩니다.").textColor(gray).fontSize(12),
                    ],
                  ),
                  Text("태어난 시간 모름 버튼을 누르면 출생시간은 반영디지 않습니다.").textColor(gray).fontSize(12).padding(left: 15),
                ],
              ),
              const SizedBox(height: 40),
              textfield("전화번호", "- 제외하고 입력해주세요", phoneController),
              const SizedBox(height: 40),
              textfield("이메일 주소", "abc@gmail.com", emailController),
              const SizedBox(height: 40),
              Button(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Text("저장 후 사주 확인").textColor(Colors.black).fontSize(18).bold().padding(all: 15).center(),
                ),
                onPressed: () {
                  var year = birthController.text.substring(0, 4);
                  var month = birthController.text.substring(4, 6);
                  var day = birthController.text.substring(6, 8);
                  var hour = dateTime.value?.hour ?? 0;
                  var minuite = dateTime.value?.minute ?? 0;
                  var date = DateTime(
                    int.parse(year),
                    int.parse(month),
                    int.parse(day),
                    hour,
                    minuite,
                  );
                  print(date);
                  ref.read(infoProvider.notifier).state = Info(
                    date,
                    int.parse(year),
                    int.parse(month),
                    int.parse(day),
                    hour,
                    minuite,
                    gender.value,
                    isLunar.value,
                    nameController.text,
                    phoneController.text,
                    emailController.text,
                  );
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const FortuneScreen()),
                  );
                },
              )
            ],
          ).padding(horizontal: 20),
        ),
      ),
      // body: CupertinoButton.filled(
      //   child: Text("결과 확인"),
      //   onPressed: () async {
      //     // print(ref.read(solarDatesProvider).dates);
      //     // ref.read(infoProvider.notifier).state = Info(2001, 4, 17, 10, 6, Gender.male);
      //     ref.read(infoProvider.notifier).state = Info(1971, 8, 24, 3, 6, Gender.male);
      //     // ref.read(infoProvider.notifier).state = Info(2023, 1, 15, 0, 0, Gender.male);
      //     // ref.read(infoProvider.notifier).state = Info(2023, 5, 15, 0, 0, Gender.male);

      //     // ref.refresh(fortuneProvider);
      //     Navigator.push(
      //       context,
      //       CupertinoPageRoute(builder: (context) => const FortuneScreen()),
      //     );
      //   },
      // ).center(),
    );
  }

  Row checkbox(ValueNotifier<bool> reverse, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.0,
          width: 24.0,
          child: Theme(
            data: ThemeData(unselectedWidgetColor: const Color(0xff262626)),
            child: Checkbox(
              activeColor: Colors.white,
              checkColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              value: !reverse.value,
              onChanged: (value) {
                reverse.value = false;
              },
            ),
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          '윤달',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        SizedBox(
          height: 24.0,
          width: 24.0,
          child: Theme(
            data: ThemeData(unselectedWidgetColor: const Color(0xff262626)),
            child: Checkbox(
              activeColor: Colors.white,
              checkColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              value: reverse.value,
              onChanged: (value) {
                reverse.value = true;
              },
            ),
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          '음력',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }

  Widget textfield(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).fontSize(15).bold(),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            // labelText: "이름",
            // labelStyle: TextStyle(color: Colors.white, fontSize: 18),
            hintStyle: TextStyle(color: Colors.grey.shade600),
            hintText: hint,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: gray,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
