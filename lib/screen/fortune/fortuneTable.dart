import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortuna/provider/fortuneProvider.dart';
import 'package:fortuna/service/color.dart';
import 'package:fortuna/service/extension.dart';
import 'package:fortuna/service/numberToEnglish.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class FortuneTable extends ConsumerWidget {
  const FortuneTable({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fortune = ref.watch(fortuneProvider)!;
    return Theme(
      data: ThemeData(
          dividerColor: Colors.white.withOpacity(0.2),
          dividerTheme: const DividerThemeData(
            space: 0,
          )),
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        child: Container(
          // padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: tableColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 0.5,
              )),
          child: Column(
            children: [
              graph2(fortune),
              const Divider(),
              graph3(fortune),
              const Divider(),
              graph4(ref),
              const Divider(),
              graph5(fortune),
              const Divider(),
              graph6(fortune),
              const Divider(),
              graph7_11(fortune),
              const Divider(),
              graph12_13(fortune),
              const Divider(),
              const Text("대운").center().padding(all: 5),
              const Divider(),
              division(),
              const Divider(),
              graph14(fortune),
              const Divider(),
              graph15(fortune),
              const Divider(),
              graph16(fortune),
            ],
          ),
        ),
      ).padding(all: 10),
    );
  }

  IntrinsicHeight graph12_13(Fortune fortune) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const Text("목").center().expanded(),
          const VerticalDivider(),
          Text(fortune.graph12[0]).center().expanded(),
          const VerticalDivider(),
          const Text("화").center().expanded(),
          const VerticalDivider(),
          Text(fortune.graph12[1]).center().expanded(),
          const VerticalDivider(),
          const Text("토").center().expanded(),
          const VerticalDivider(),
          Text(fortune.graph12[2]).center().expanded(),
          const VerticalDivider(),
          const Text("금").center().expanded(),
          const VerticalDivider(),
          Text(fortune.graph12[3]).center().expanded(),
          const VerticalDivider(),
          const Text("수").center().expanded(),
          const VerticalDivider(),
          Text(fortune.graph12[4]).center().expanded(),
          const VerticalDivider(),
          Text(fortune.reverse ? "역운" : "순운").center().expanded(),
          const VerticalDivider(),
          Text(fortune.graph13).padding(vertical: 5).center().expanded(),
        ],
      ),
    );
  }

  Widget graph2(Fortune fortune) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var map in fortune.graph2.asMap().entries) ...[
            Text(
              eToChinese(map.value),
            ).center().padding(all: 5),
            if (map.key != 3) const VerticalDivider(),
          ]
        ],
      ),
    );
  }

  Widget graph4(WidgetRef ref) {
    var text = ref.watch(fortuneProvider)!.graph4_1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("월의 심천 "),
        Text("("),
        Text("초 ").textColor(text == "초" ? Colors.red : Colors.white),
        Text("중 ").textColor(text == "중" ? Colors.red : Colors.white),
        Text("정").textColor(text == "정" ? Colors.red : Colors.white),
        Text(") "),
        Text(ref.read(fortuneProvider)!.graph4_2),
      ],
    ).padding(all: 5);
  }

  Widget division() {
    var list = ['구분', '10운', '9운', '8운', '7운', '6운', '5운', '4운', '3운', '2운', '1운', '입운'];
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var item in list.asMap().entries.toList()) ...[
            Text(item.value).padding(vertical: 5).center().expanded(),
            if (item.key != 12) const VerticalDivider(),
          ],
        ],
      ),
    );
  }

  Widget graph14(Fortune fortune) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("간지").center().expanded(),
          const VerticalDivider(),
          for (var item in fortune.graph14) ...[
            Text(eToChinese(item[0]) + eToChinese(item[1])).padding(vertical: 5).center().expanded(),
            const VerticalDivider(),
          ]
        ],
      ),
    );
  }

  Widget graph15(Fortune fortune) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("통변").center().expanded(),
          const VerticalDivider(),
          for (var item in fortune.graph15) ...[
            Text(item).padding(vertical: 5).center().expanded(),
            const VerticalDivider(),
          ],
        ],
      ),
    );
  }

  Widget graph16(Fortune fortune) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("12운").center().expanded(),
          const VerticalDivider(),
          for (var item in fortune.graph16) ...[
            Text(item).padding(vertical: 5).center().expanded(),
            const VerticalDivider(),
          ],
        ],
      ),
    );
  }

  Widget graph7_11(Fortune fortune) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("공망").center().expanded(),
          const VerticalDivider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var item in fortune.graph7) Text(eToChinese(item)),
            ],
          ).center().expanded(),
          const VerticalDivider(),
          const Text("양인").center().expanded(),
          const VerticalDivider(),
          Text(eToChinese(fortune.graph8)).center().expanded(),
          const VerticalDivider(),
          const Text("원진").center().expanded(),
          const VerticalDivider(),
          Text(eToChinese(fortune.graph9)).center().expanded(),
          const VerticalDivider(),
          const Text("용신\n보좌").center().expanded(),
          const VerticalDivider(),
          Column(
            children: [
              for (var item in fortune.graph11[1].split('')) Text(eToChinese(item)),
            ],
          ).expanded(),
          const VerticalDivider(),
          // Text(eToChinese(fortune.graph11[1])),
          const Text("명궁").center().expanded(),
          const VerticalDivider(),
          Text(eToChinese(fortune.graph10)).center().expanded(),
          const VerticalDivider(),
          const Text("조후\n용신").center().expanded(),
          const VerticalDivider(),
          Text(eToChinese(fortune.graph11[0])).center().expanded(),
          const VerticalDivider(),
        ],
      ),
    );
  }

  Widget graph6(Fortune fortune) {
    return LayoutBuilder(builder: (context, layout) {
      return IntrinsicHeight(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var item in fortune.graph6.asMap().entries) ...[
              Container(
                // color: Colors.blue,
                width: layout.biggest.width / 4,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var text in item.value) Text(text).padding(vertical: 2),
                      ],
                    ).center().expanded(),
                  ],
                ),
              ),
              if (item.key != 3) const VerticalDivider(width: 0),
            ],
            // Row(
            //   children: [
            //   ],
            // ),
          ],
        ),
      );
    });
  }

  Widget graph5(Fortune fortune) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(fortune.graph5[0]).center().expanded(),
          const VerticalDivider(),
          Text(fortune.graph5[1]).center().expanded(),
          const VerticalDivider(),
          Text(fortune.graph5[2]).center().expanded(),
          const VerticalDivider(),
          Text(fortune.graph5[3]).padding(vertical: 5).center().expanded(),

          // for (var item in fortune.graph5.asMap().entries.toList()) ...[
          //   Text(item.value).center(),
          //   const VerticalDivider(),
          //   // if (item.key != 3) ,
          // ],
        ],
      ),
    );
  }

  Widget graph3(Fortune fortune) {
    return IntrinsicHeight(
      child: Row(
        children: [
          for (var i = 0; i < 4; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var j = 0; j < 3; j++) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(eToChinese(fortune.graph3[i][j])).padding(all: 5),
                    ],
                  ).expanded(),
                  if (!(i == 3 && j == 2)) const VerticalDivider(width: 0),
                ]
              ],
            ).expanded(),
          // for (var i = 0; i < 12; i++) const Text("A").center().expanded(),
        ],
      ),
    );
  }
}
