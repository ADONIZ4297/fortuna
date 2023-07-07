import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/screen/login/loginMethod.dart';
import 'package:fortuna/service/button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Spacer(),
          Text("로고"),
          const Spacer(),
          login("카카오 계정으로 시작하기", "kakao", () {
            LoginMethod.kakaoLogin();
          }),
          login("구글 계정으로 시작하기", "google", () {
            LoginMethod.googleLogin();
          }),
          login("Apple로 시작하기", "apple", () {
            LoginMethod.appleLogin();
          }),
          const Spacer(),
        ],
      ),
    );
  }

  Button login(String title, String icon, Function funciton) {
    return Button(
      child: Container(
        // height: 60,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/${icon}.png",
              height: 25,
            ),
            const SizedBox(width: 10),
            Text(title).textColor(Colors.black).bold().fontSize(18),
          ],
        ).padding(all: 18),
      ),
      onPressed: () {
        funciton();
      },
    );
  }
}
