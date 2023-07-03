import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/provider/fortuneProvider.dart';
import 'package:fortuna/service/numberToEnglish.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class BasicGrid extends ConsumerWidget {
  const BasicGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fortune = ref.watch(fortuneProvider)!;
    var list = [
      fortune.a,
      fortune.p,
      fortune.v,
      fortune.s,
      fortune.b,
      fortune.q,
      fortune.u,
      fortune.t,
    ];
    return LayoutBuilder(builder: (context, layout) {
      var width = layout.biggest.width;
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8, //item 개수
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 1, //item 의 가로 1, 세로 2 의 비율
        ),
        itemBuilder: (BuildContext context, int index) {
          return Text(list[index])
              // return Text(eToChinese(list[index]))
              .fontSize(40)
              .bold()
              .center()
              .decorated(color: Colors.amber, borderRadius: BorderRadius.circular(16))
              .padding(all: 10);
        }, //item 의 반목문 항목 형성
      );
      // return Column(
      //   children: [
      //     for (var i = 0; i < 2; i++)
      //       Row(
      //         children: [
      //           for (var i = 0; i < 4; i++)
      //             Text("G")
      //                 .center()
      //                 .width(width / 4)
      //                 .height(width / 4)
      //                 .decorated(color: Colors.red, borderRadius: BorderRadius.circular(20))
      //         ],
      //       )
      //   ],
      // );
    });
  }
}
