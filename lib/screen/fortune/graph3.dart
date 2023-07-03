import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortuna/provider/fortuneProvider.dart';
import 'package:fortuna/service/numberToEnglish.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class Graph3 extends ConsumerWidget {
  const Graph3({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var graph3 = ref.watch(fortuneProvider)!.graph3;
    return Row(
      children: [
        for (var i = 0; i < 4; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var j = 0; j < 3; j++) Text(eToChinese(graph3[i][j])).bold().padding(all: 2),
            ],
          )
              .decorated(
                border: Border.all(
                  color: Colors.white,
                ),
              )
              .expanded(),
        // for (var i = 0; i < 12; i++) const Text("A").center().expanded(),
      ],
    ).padding(horizontal: 5, top: 10);
  }
}
