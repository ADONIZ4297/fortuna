import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortuna/provider/fortuneProvider.dart';
import 'package:fortuna/service/extension.dart';
import 'package:fortuna/service/numberToEnglish.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class FortuneTable extends ConsumerWidget {
  const FortuneTable({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fortune = ref.watch(fortuneProvider)!;
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: HexColor("1E1E1E"),
        child: Column(
          children: [
            graph3(fortune),
            const Divider(),
            graph5(fortune).padding(vertical: 5),
            const Divider(),
            graph6(fortune).padding(vertical: 5),
            const Divider(),
            graph7_11(fortune),
            const Divider(),
            graph12_13(fortune),
            const Divider(),
            const Text("대운").center(),
            const Divider(),
            division(),
            graph14(fortune),
            graph15(fortune),
            graph16(fortune),
          ],
        ),
      ),
    ).padding(all: 10);
  }

  Row division() {
    var list = ['구분', '10운', '9운', '8운', '7운', '6운', '5운', '4운', '3운', '2운', '1운', '입운'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var item in list) Text(item).center().expanded(),
      ],
    );
  }

  Row graph14(Fortune fortune) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("간지").center().expanded(),
        for (var item in fortune.graph14) Text(item).center().expanded(),
      ],
    );
  }

  Row graph15(Fortune fortune) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("통변").center().expanded(),
        for (var item in fortune.graph15) Text(item).center().expanded(),
      ],
    );
  }

  Row graph16(Fortune fortune) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("12운").center().expanded(),
        for (var item in fortune.graph16) Text(item).center().expanded(),
      ],
    );
  }

  Row graph12_13(Fortune fortune) {
    return Row(
      children: [
        Text(fortune.reverse ? "역운" : "순운"),
      ],
    );
  }

  Row graph7_11(Fortune fortune) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("공망").center().expanded(),
        Column(
          children: [
            for (var item in fortune.graph7) Text(eToChinese(item)),
          ],
        ).center().expanded(),
        const Text("양인").center().expanded(),
        Text(eToChinese(fortune.graph8)).center().expanded(),
        const Text("원진").center().expanded(),
        Text(eToChinese(fortune.graph9)).center().expanded(),
        const Text("용신\n보좌").center().expanded(),
        Column(
          children: [
            for (var item in fortune.graph11[1].split('')) Text(eToChinese(item)),
          ],
        ).expanded(),
        // Text(eToChinese(fortune.graph11[1])),
        const Text("명궁").center().expanded(),
        Text(eToChinese(fortune.graph10)).center().expanded(),
        const Text("조후\n용신").center().expanded(),
        Text(eToChinese(fortune.graph11[0])).center().expanded(),
      ],
    );
  }

  Row graph6(Fortune fortune) {
    return Row(
      children: [
        for (var item in fortune.graph6)
          Column(
            children: [
              for (var text in item) Text(text).padding(vertical: 5),
            ],
          ).expanded(),
      ],
    );
  }

  Row graph5(Fortune fortune) {
    return Row(
      children: [
        for (var item in fortune.graph5) Text(item).center().expanded(),
      ],
    );
  }

  Widget graph3(Fortune fortune) {
    return Row(
      children: [
        for (var i = 0; i < 4; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var j = 0; j < 3; j++) Text(eToChinese(fortune.graph3[i][j])),
            ],
          ).expanded(),
        // for (var i = 0; i < 12; i++) const Text("A").center().expanded(),
      ],
    ).padding(vertical: 5);
  }
}
