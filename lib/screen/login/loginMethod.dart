import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginMethod {
  static googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'profile',
      ],
    );
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    //로그인 성공 시
    if (account != null) {
      final GoogleSignInAuthentication googleAuth = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      registerUser("google", account.email, account.displayName ?? "name", null, null, true);
    }
  }

  static appleLogin() async {
    AuthorizationCredentialAppleID appleCredential = await SignInWithApple.getAppleIDCredential(
      webAuthenticationOptions: WebAuthenticationOptions(
        clientId: "com.ingon.pooltime.android",
        redirectUri: Uri.parse("https://spurious-warp-seer.glitch.me/callbacks/sign_in_with_apple"),
      ),
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
    var result = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    print(appleCredential.givenName);
    registerUser("apple", FirebaseAuth.instance.currentUser?.email ?? "error", appleCredential.givenName ?? "error",
        null, null, true);
  }

  static kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      await UserApi.instance.loginWithKakaoTalk();
    } else {
      await UserApi.instance.loginWithKakaoAccount();
    }

    var kakaoUser = await UserApi.instance.me();
    print(kakaoUser);

    //카카오 고유 회원번호 (변하지 않음)
    var id = kakaoUser.id.toString();
    var email = id + "@kakao.com";
    print(email);
    //로그인 시도
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: id);
    } on FirebaseAuthException catch (e) {
      //실패 시 자동 가입 및 로그인
      if (e.code == "user-not-found") {
        print('새로운 가입자');
        print(kakaoUser);
        print(kakaoUser.kakaoAccount);
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: id,
        );
      }
    }
    registerUser(
      "kakao",
      kakaoUser.kakaoAccount?.email ?? "error",
      kakaoUser.kakaoAccount?.profile?.nickname ?? "name",
      null,
      null,
      true,
    );
  }

  static emailLogin(String loginType, String email, String password, String name, String? birth, String? gender,
      bool verify, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      //실패 시 자동 가입 및 로그인
      if (e.code == "user-not-found") {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      }
      if (e.code == "wrong-password") {
        return;
      }
      print(e.code);
    }
    await registerUser(loginType, email, name, birth, gender, verify);
  }

  static registerUser(String loginType, String email, String name, String? birth, String? gender, bool verify) async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    //유저 존재 시 체크
    FirebaseFirestore.instance.collection("users").doc(uid).get().then((value) {
      if (value.exists) {
        return;
      } else {
        //유저 없을 시 생성
        FirebaseFirestore.instance.collection("users").doc(uid).set({
          "uid": uid,
          "loginType": loginType,
          "email": email,
          "name": name,
          "birth": birth,
          "gender": gender,
          "verify": verify,
          "timestamp": DateTime.now(),
        });
      }
    });
  }
}
