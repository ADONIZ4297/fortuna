import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fortuna/service/button.dart';
import 'package:fortuna/service/color.dart';
import 'package:fortuna/service/extension.dart';
import 'package:fortuna/service/numberToEnglish.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

final List<String> aa = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];
final List<String> bb = ['m', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'k', 'l'];

class YearMonthDay extends HookConsumerWidget {
  const YearMonthDay({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var infoDate = useState(DateTime.now());
    List<List<String>> years = getYears();
    List<List<String>> months = getMonth(infoDate.value);
    // useMemoized(() {
    //   print(years);
    // });
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          // height: 300,
          decoration: BoxDecoration(
            color: tableColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("년운").fontSize(18).bold(),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        for (var list in years) ...[
                          Button(
                            onPressed: () {
                              infoDate.value = DateTime(int.parse(list[0].substring(0, 4)));
                            },
                            child: Column(
                              children: [
                                for (var item in list.asMap().entries.toList()) ...[
                                  Container(
                                    color: item.key == 0 ? const Color(0xff2b2b2b) : Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        if (item.key == 0)
                                          Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: Container(
                                              width: 5,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                color: item.value == DateFormat("yyyy년").format(infoDate.value)
                                                    ? Colors.black
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                            ).center(),
                                          ),
                                        const SizedBox(width: 5),
                                        Container(
                                          // color: item.key == 0 ? const Color(0xff2b2b2b) : Colors.white.withOpacity(0.02),
                                          child:
                                              Text(item.key == 0 ? item.value : eToChinese(item.value)).bold().center(),
                                        ),
                                      ],
                                    ).padding(all: 10),
                                  ),
                                  if (item.key == 1)
                                    Container(
                                      height: 1,
                                      width: 80,
                                      color: Colors.white.withOpacity(0.2),
                                    ),
                                ]
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white.withOpacity(0.2),
                            width: 0,
                          ),
                        ]
                      ],
                    ).scrollable(scrollDirection: Axis.horizontal),
                  ),
                ),
                // child: Column(
                //   children: [
                //     for (var i = 0; i < 13; i++) const Text("구분"),
                //   ],
                // ),
                // child: GridView.builder(
                //   scrollDirection: Axis.horizontal,
                //   padding: const EdgeInsets.all(1),
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 4,
                //     crossAxisSpacing: 1,
                //     mainAxisSpacing: 1,
                //     childAspectRatio: 1 / 2,
                //   ),
                //   itemCount: 40,
                //   shrinkWrap: true,
                //   itemBuilder: (context, index) {
                //     int row = index % 4;
                //     int column = index ~/ 1;
                //     if (row == 0 || column == 0) {
                //       // 첫 번째 행과 열에 색상을 추가합니다.
                //       return Container(
                //         color: const Color(0xff2b2b2b),
                //         child: const Center(
                //           child: Text(
                //             '2023년',
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       );
                //     } else {
                //       // 나머지 셀에는 텍스트만 표시합니다.
                //       return IntrinsicHeight(
                //         child: Container(
                //           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                //           color: const Color(0xff171717),
                //           child: Center(
                //             child: Text(
                //               dayday[index],
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     }
                //   },
                // ),
              ),
            ],
          ),
        ),
      ],
    ).padding(horizontal: 10, vertical: 10);
  }

  List<List<String>> getYears() {
    List<List<String>> years = [];
    var index1 = aa.indexWhere((element) => element == "j");
    var index2 = bb.indexWhere((element) => element == "n");
    for (var i = 0; i < 50; i++) {
      years.add([]);
      years[i].add(DateFormat("yyyy년").format(DateTime(2023 + i, 1, 1)));
      years[i].add(aa[index1]);
      years[i].add(bb[index2]);
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

      // years[i] = [aa[index1], bb[index2]];
    }
    return years;
  }

  List<List<String>> getMonth(DateTime date) {
    List<List<String>> years = [];

    var v = sToEnglsh((2 * date.year + date.month + 3) % 10);
    var u = tToEnglsh((date.month + 1) % 12);
    print(v);
    print(u);

    // years[0] = [];
    // years[1] = [];
    // years[2] = [];
    var index1 = aa.indexWhere((element) => element == "j");
    var index2 = bb.indexWhere((element) => element == "n");
    for (var i = 0; i < 50; i++) {
      years.add([]);
      years[i].add(DateFormat("yyyy년").format(DateTime(2023 + i, 1, 1)));
      years[i].add(aa[index1]);
      years[i].add(bb[index2]);
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

      // years[i] = [aa[index1], bb[index2]];
    }
    return years;
  }
}
