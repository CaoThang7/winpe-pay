import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String phone;
  final String uid;
  final DateTime? dateCreated;
  final DateTime? dateSignedIn;
  const User({
    required this.phone,
    required this.uid,
    required this.dateCreated,
    required this.dateSignedIn,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        phone: snapshot["phone"],
        uid: snapshot["uid"],
        dateCreated: snapshot['dateCreated'],
        dateSignedIn: snapshot['dateSignedIn']);
  }

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "uid": uid,
        "dateCreated": dateCreated,
        "dateSignedIn": dateSignedIn
      };
}
