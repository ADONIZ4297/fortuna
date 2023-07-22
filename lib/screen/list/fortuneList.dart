import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/provider/infoProvider.dart';
import 'package:fortuna/screen/fortune/profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class FortuneListScreen extends ConsumerWidget {
  const FortuneListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("사주 목록").textColor(Colors.white),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("fortunes")
            .orderBy("timestamp")
            .snapshots(),
        builder: (context, snapshot) {
          var docs = snapshot.data?.docs;
          if (docs == null) {
            return Container();
          }
          return ListView(
            children: [
              for (var doc in docs.map((e) => Info.fromFirestore(e))) Profile(info: doc, isList: true),
            ],
          );
        },
      ),
    );
  }
}
