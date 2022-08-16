import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? phone;
  final String? uid;
  final DateTime? dateCreated;
  final DateTime? dateSignedIn;
  const User({
    required this.phone,
    required this.uid,
    required this.dateCreated,
    required this.dateSignedIn,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        phone: json["phone"],
        uid: json["uid"],
        dateCreated: json['dateCreated'].toDate(),
        dateSignedIn: json['dateSignedIn'].toDate(),
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "uid": uid,
        "dateCreated": dateCreated,
        "dateSignedIn": dateSignedIn
      };
}
