import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fortuna/service/enum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Info {
  String? id;
  DateTime? timestamp;
  DateTime date;
  Gender gender;
  bool isLunar;
  String name;
  String phone;
  String email;
  Info(this.id, this.date, this.gender, this.isLunar, this.name, this.phone, this.email);

  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp,
      'date': date,
      'gender': gender == Gender.female ? "여자" : "남자",
      'isLunar': isLunar,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  factory Info.fromFirestore(DocumentSnapshot doc) {
    var map = (doc.data() as dynamic);
    return Info(
      doc.id,
      map['date'].toDate(),
      map['gender'] == "남자" ? Gender.male : Gender.female,
      map['isLunar'],
      map['name'],
      map['phone'],
      map['email'],
    );
  }
}

final infoProvider = StateProvider<Info?>((ref) {
  return null;
});
