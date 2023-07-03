import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/provider/fortuneProvider.dart';
import 'package:fortuna/service/extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class Graph1 extends HookConsumerWidget {
  const Graph1({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var graph1 = ref.watch(fortuneProvider)!.graph1;
    print(graph1);
    List<String> graph = [
      "생시",
      "생일",
      "생월",
      "생년",
      ...graph1,
    ];
    print(graph);
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemCount: 8, //item 개수
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2 / 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),

      itemBuilder: (context, index) {
        return Text(graph[index]).fontSize(16).fontWeight(FontWeight.w600).center().backgroundColor(
              HexColor("1E1E1E"),
            );
      },
    );
    // return Column(
    //   children: [
    //     for (var i = 0; i < 3; i++)
    //       Row(
    //         children: [
    //           for (var j = 0; j < 4; j++) Text(graph[i][j]),
    //         ],
    //       )
    //   ],
    // );
  }
}
