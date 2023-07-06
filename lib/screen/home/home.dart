import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fortuna/provider/infoProvider.dart';
import 'package:fortuna/provider/solarDatesProvider.dart';
import 'package:fortuna/screen/fortune/fortuneScreen.dart';
import 'package:fortuna/service/enum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:path/path.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useMemoized(() {
      ref.refresh(solarDatesProvider);
    });
    return Scaffold(
      body: CupertinoButton.filled(
        child: Text("결과 확인"),
        onPressed: () async {
          // print(ref.read(solarDatesProvider).dates);
          ref.read(infoProvider.notifier).state = Info(2001, 4, 17, 10, 6, Gender.male);
          // ref.read(infoProvider.notifier).state = Info(1971, 8, 24, 3, 6, Gender.male);
          // // ref.read(infoProvider.notifier).state = Info(1981, 12, 20, 7, 0, Gender.male);
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const FortuneScreen()),
          );
        },
      ).center(),
    );
  }
}
