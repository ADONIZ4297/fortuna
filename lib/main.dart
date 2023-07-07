import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortuna/provider/fortuneProvider.dart';
import 'package:fortuna/provider/infoProvider.dart';
import 'package:fortuna/provider/solarDatesProvider.dart';
import 'package:fortuna/screen/fortune/fortuneScreen.dart';
import 'package:fortuna/screen/fortune/yearMonthDay.dart';
import 'package:fortuna/screen/home/home.dart';
import 'package:fortuna/screen/list/fortuneList.dart';
import 'package:fortuna/screen/login/login.dart';
import 'package:fortuna/screen/myProfile/myProfile.dart';
import 'package:fortuna/service/button.dart';
import 'package:fortuna/service/color.dart';
import 'package:fortuna/service/extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(background: Colors.black),
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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return const Screen();
          }
          return const Login();
        },
      ),
      // home: const Screen(),
    );
  }
}

class Screen extends HookConsumerWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useMemoized(() {
      ref.refresh(solarDatesProvider);
    });
    var index = useState(0);
    return Scaffold(
      body: IndexedStack(
        index: index.value,
        children: const [
          Home(),
          FortuneListScreen(),
          MyProfileScreen(),
        ],
      ),
      // body: const Home(),
      // body: const YearMonthDay(),
      bottomNavigationBar: BottomAppBar(
        // currentIndex: index.value,
        // onTap: (i) {
        //   index.value = i;
        //   print(index.value);
        // },
        // type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.black,
        // unselectedItemColor: const Color(0xff777674),
        // selectedItemColor: Colors.white,
        // unselectedIconTheme: IconThemeData(color: Colors.red),
        // selectedIconTheme: IconThemeData(color: Colors.blue),
        // unselectedFontSize: 13,
        // selectedFontSize: 13,
        elevation: 0.0,
        color: background,
        height: 65,
        child: Row(
          children: [
            Button(
              onPressed: () {
                index.value = 0;
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_home.svg',
                    color: index.value == 0 ? Colors.white : gray,
                  ).expanded(),
                  const Text("홈")
                ],
              ),
            ).expanded(),
            Button(
              onPressed: () {
                index.value = 1;
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_sandbar.svg',
                    color: index.value == 1 ? Colors.white : gray,
                  ).expanded(),
                  const Text("사주목록")
                ],
              ),
            ).expanded(),
            Button(
              onPressed: () {
                index.value = 2;
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_profile.svg',
                    color: index.value == 2 ? Colors.white : gray,
                  ).expanded(),
                  const Text("프로필")
                ],
              ),
            ).expanded(),
            // BottomNavigationBarItem(
            //     icon: SvgPicture.asset(
            //       'assets/images/ic_home.svg',
            //       color: index.value == 0 ? Colors.red : Colors.white,
            //     ),
            //     label: "홈"),
            // BottomNavigationBarItem(
            //     icon: SvgPicture.asset(
            //       'assets/images/ic_sandbar.svg',
            //     ),
            //     label: "사주목록"),
            // BottomNavigationBarItem(
            //     icon: SvgPicture.asset(
            //       'assets/images/ic_profile.svg',
            //     ),
            //     label: "프로필"),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.black,
      //   height: 65,
      //   child: Row(
      //     children: [
      //       Column(
      //         children: [
      //           SvgPicture.asset('assets/images/ic_home.svg'),
      //           const Text("홈"),
      //         ],
      //       ).expanded()
      //     ],
      //   ),
      // ),
    );
  }
}
