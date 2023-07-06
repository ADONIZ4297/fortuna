import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/provider/fortuneProvider.dart';
import 'package:fortuna/provider/infoProvider.dart';
import 'package:fortuna/screen/fortune/fortuneScreen.dart';
import 'package:fortuna/screen/home/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: const Home(),
    );
  }
}
