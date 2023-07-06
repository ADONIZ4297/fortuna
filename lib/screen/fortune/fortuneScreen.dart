import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/provider/fortuneProvider.dart';
import 'package:fortuna/provider/infoProvider.dart';
import 'package:fortuna/screen/fortune/basicGrid.dart';
import 'package:fortuna/screen/fortune/graph1.dart';
import 'package:fortuna/screen/fortune/fortuneTable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class FortuneScreen extends ConsumerWidget {
  const FortuneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("사주확인").textColor(Colors.white),
      ),
      body: ListView(
        children: const [
          Graph1(),
          BasicGrid(),
          FortuneTable(),
        ],
      ),
    );
  }
}
