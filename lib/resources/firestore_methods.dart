import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winpe_pay/resources/storage_methods.dart';
import 'package:winpe_pay/utils/utils.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImage({
    required Uint8List file,
    required BuildContext context,
  }) async {
    String res = "Đã xảy ra một số lỗi";
    try {
      if (file != null) {
        //save image to storage firebase
        String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file);
        final User user = _auth.currentUser!;

        //update image url to Firestore firebase (table users)
        _firestore
            .collection('users')
            .doc(user.uid)
            .update({"photoUrl": photoUrl});

        //show SnackBar upload image success   
        res = "Thêm ảnh thành công!";
        showSnackBar(context, res);
      } else {
        res = "Lỗi rồi! thêm ảnh thất bại";
        showSnackBar(context, res);
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
