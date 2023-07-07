import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/provider/fortuneProvider.dart';
import 'package:fortuna/service/color.dart';
import 'package:fortuna/service/extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class Graph1 extends HookConsumerWidget {
  const Graph1({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var graph1 = ref.watch(fortuneProvider)!.graph1;
    List<String> graph = [
      "생시",
      "생일",
      "생월",
      "생년",
      ...graph1,
    ];
    return ClipRRect(
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 0.5,
          ),
          color: Colors.white.withOpacity(0.2),
          // borderRadius: BorderRadius.circular(10),
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          itemCount: 8, //item 개수
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 2 / 1,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),

          itemBuilder: (context, index) {
            return Text(graph[index]).fontSize(16).fontWeight(FontWeight.w600).center().backgroundColor(
                  tableColor,
                );
          },
        ),
      ),
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
