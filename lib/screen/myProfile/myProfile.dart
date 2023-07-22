import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/service/button.dart';
import 'package:fortuna/service/color.dart';
import 'package:fortuna/service/modalPopup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fortuna").textColor(Colors.white),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snpashot) {
                var user = snpashot.data?.data();
                if (user == null) {
                  return Container();
                }
                return Row(
                  children: [
                    Image.asset(
                      "assets/images/profile.png",
                      height: 70,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      user['name']!,
                    ).bold().fontSize(22),
                  ],
                ).padding(all: 30);
              }),
          Button(
            child: Row(
              children: [
                const Text("계정 삭제").bold().fontSize(16).textColor(Colors.white.withOpacity(0.6)),
                const Spacer(),
                Icon(CupertinoIcons.chevron_right, color: Colors.white.withOpacity(0.6)),
              ],
            ).padding(all: 15).decorated(
                  color: tableColor,
                ),
            onPressed: () {},
          ),
          Button(
            child: Row(
              children: [
                Text("로그아웃").bold().fontSize(16).textColor(Colors.white.withOpacity(0.6)),
                Spacer(),
                Icon(CupertinoIcons.chevron_right, color: Colors.white.withOpacity(0.6)),
              ],
            ).padding(all: 15).decorated(
                  color: tableColor,
                ),
            onPressed: () async {
              if (await showModal(context, "로그아웃 하시겠습니까?", "지금 로그아웃 하시겠어요?") == true) {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
    );
  }
}
