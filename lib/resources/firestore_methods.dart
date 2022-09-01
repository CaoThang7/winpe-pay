import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winpe_pay/resources/storage_methods.dart';
import 'package:winpe_pay/screens/account/profile_screen.dart';
import 'package:winpe_pay/utils/utils.dart';
import 'dart:async';
import 'package:winpe_pay/models/transfer_content.dart' as model;
import 'package:uuid/uuid.dart';

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
        String photoUrl =
            await StorageMethods().uploadImageToStorage('profilePics', file);
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

  Future<void> updateProfile({
    required String username,
    required BuildContext context,
  }) async {
    try {
      if (username.isEmpty) {
        showSnackBar(context, "Họ tên không được bỏ trống");
        return;
      }
      if (!RegExp(r'^[a-z A-Z]+$').hasMatch(username)) {
        showSnackBar(context, "Không được chứa số và ký tự đặc biệt");
        return;
      }
      var username_exist = await _firestore
          .collection("users")
          .where("username", isEqualTo: username)
          .get()
          .then((value) => value.size > 0 ? true : false);
      if (username_exist == true) {
        showSnackBar(context, "Họ tên đã tồn tại");
        return;
      }
      final User user = _auth.currentUser!;
      //update username save database
      _firestore
          .collection('users')
          .doc(user.uid)
          .update({"username": username});

      showSnackBar(context, 'Cập nhật thành công!');

      Timer(Duration(seconds: 2), () {
        Navigator.pushNamed(context, ProfileScreen.routeName);
      });
    } catch (err) {}
  }

  Future<void> transfer({
    required String uidSender,
    required String uidreceiver,
    required String money,
    required String content,
    required String account_money,
    required int moneyReceiver,
    required BuildContext context,
  }) async {
    String transferContentId = const Uuid().v1();
    try {
      model.TransferContent transferContent = model.TransferContent(
        uid: transferContentId,
        uidSender: uidSender,
        uidreceiver: uidreceiver,
        money: int.parse(money),
        content: content,
        time: DateTime.now(),
      );

      //create table database transfer in firestore
      await _firestore
          .collection("transfer")
          .doc(transferContentId)
          .set(transferContent.toJson());

      //update money user sender
      await _firestore
          .collection('users')
          .doc(uidSender)
          .update({"money": int.parse(account_money) - int.parse(money)});

      //update money user receiver
      await _firestore
          .collection('users')
          .doc(uidreceiver)
          .update({"money": moneyReceiver + int.parse(money)});

      showDiaLogPayment(context);
    } catch (err) {}
  }
}
