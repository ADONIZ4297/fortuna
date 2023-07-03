import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/provider/infoProvider.dart';
import 'package:fortuna/screen/fortune/fortuneScreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CupertinoButton.filled(
        child: Text("결과 확인"),
        onPressed: () {
          ref.read(infoProvider.notifier).state = Info(2001, 4, 17, 3, 6);
          // ref.read(infoProvider.notifier).state = Info(1978, 12, 11, 7, 30);
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const FortuneScreen()),
          );
        },
      ).center(),
    );
  }
}
