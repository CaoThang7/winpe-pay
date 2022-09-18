import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winpe_pay/models/gift.dart';
import 'package:winpe_pay/models/notification.dart' as model;
import 'package:winpe_pay/resources/storage_methods.dart';
import 'package:winpe_pay/screens/account/profile_screen.dart';
import 'package:winpe_pay/screens/gift/gift_success.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:winpe_pay/utils/utils.dart';
import 'dart:async';
import 'package:winpe_pay/models/transfer_content.dart' as model;
import 'package:uuid/uuid.dart';
import 'package:winpe_pay/resources/message_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winpe_pay/models/mygift.dart' as model;

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final MessageMethods messageMethods = MessageMethods();
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
    String notificationId = const Uuid().v1();
    var usernameSender;
    var usernamereceiver;
    try {
      //get data user uidSender
      var userSender = await FirebaseFirestore.instance
          .collection('users')
          .doc(uidSender)
          .get();

      //get data user uidreceiver
      var userReceiver = await FirebaseFirestore.instance
          .collection('users')
          .doc(uidreceiver)
          .get();

      usernameSender = userSender['username'];
      usernamereceiver = userReceiver['username'];

      model.TransferContent transferContent = model.TransferContent(
          uid: transferContentId,
          uidSender: uidSender,
          uidreceiver: uidreceiver,
          time: DateTime.now(),
          transferItems: [
            {
              "uidSender": uidSender,
              "money": -int.parse(money),
              "content": content,
              "dateCreated": DateTime.now(),
              "username": usernamereceiver,
              "code": GlobalVariables().accountNo()
            },
            {
              "uidreceiver": uidreceiver,
              "money": int.parse(money),
              "content": content,
              "dateCreated": DateTime.now(),
              "username": usernameSender,
              "code": GlobalVariables().accountNo()
            },
          ]);

      model.Notification notification = model.Notification(
          uid: notificationId,
          uidSender: uidSender,
          uidreceiver: uidreceiver,
          dateCreated: DateTime.now(),
          notificaItems: [
            {
              "uidSender": uidSender,
              "money": -int.parse(money),
              "content": content,
              "dateCreated": DateTime.now(),
              "username": usernamereceiver,
            },
            {
              "uidreceiver": uidreceiver,
              "money": int.parse(money),
              "content": content,
              "dateCreated": DateTime.now(),
              "username": usernameSender,
            },
          ]);

      //create table database transfer in firestore
      await _firestore
          .collection("transfer")
          .doc(transferContentId)
          .set(transferContent.toJson());

      //create table database notification in firestore
      await _firestore
          .collection("notifications")
          .doc(notificationId)
          .set(notification.toJson());

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

      Timer(Duration(seconds: 7), () {
        messageMethods.showNotification(
          title: 'Chuyển tiền thành công',
          body: 'Cảm ơn quý khách đã sử dụng dịch vụ Winpe Pay',
          payload: "Giao dịch thành công!",
        );
      });
    } catch (err) {}
  }

  //check data Transaction history with id users
  Future<String> checkDataTransaction({
    required BuildContext context,
  }) async {
    String res = "Some error Occurred";
    try {
      String uidSender = '';
      String uidreceiver = '';
      var listTransaction =
          await FirebaseFirestore.instance.collection('transfer').get();

      for (int i = 0; i < listTransaction.docs.length; i++) {
        uidSender = listTransaction.docs[i]['uidSender'];
        uidreceiver = listTransaction.docs[i]['uidreceiver'];
      }

      if (uidSender == FirebaseAuth.instance.currentUser!.uid ||
          uidreceiver == FirebaseAuth.instance.currentUser!.uid) {
        res = "success";
      } else {
        res = "faild";
      }
    } catch (err) {}
    return res;
  }

  //check data Notificationhistory with id users
  Future<String> checkDataNotification({
    required BuildContext context,
  }) async {
    String res = "Some error Occurred";
    try {
      String uidSender = '';
      String uidreceiver = '';
      var listNotification =
          await FirebaseFirestore.instance.collection('notifications').get();

      for (int i = 0; i < listNotification.docs.length; i++) {
        uidSender = listNotification.docs[i]['uidSender'];
        uidreceiver = listNotification.docs[i]['uidreceiver'];
      }

      if (uidSender == FirebaseAuth.instance.currentUser!.uid ||
          uidreceiver == FirebaseAuth.instance.currentUser!.uid) {
        res = "success";
      } else {
        res = "faild";
      }
    } catch (err) {}
    return res;
  }

  //fetch data gift with type
  Future<void> fetchGift({
    required BuildContext context,
    required List? giftTT,
    required List? giftHOT,
  }) async {
    try {
      var gifts = await FirebaseFirestore.instance.collection('gifts').get();
      for (int i = 0; i < gifts.docs.length; i++) {
        var giftItems = gifts.docs[i];
        if (giftItems['type'] == "VCTT") {
          giftTT?.add(giftItems);
        } else {
          giftHOT?.add(giftItems);
        }
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //search name gift
  Future<void> searchGift({
    required BuildContext context,
    required String? searchQuery,
    required List? dataGift,
  }) async {
    try {
      var listGift = await _firestore
          .collection('gifts')
          .where('name', isEqualTo: searchQuery)
          .get();
      for (int i = 0; i < listGift.docs.length; i++) {
        var giftItems = listGift.docs[i];
        dataGift?.add(giftItems);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Exchange gift with diamond
  Future<void> giftExchange(
      {required BuildContext context,
      required String? diamondUser,
      required String diamondGift,
      required String? uidGift,
      required String? uidUser}) async {
    String mygiftId = const Uuid().v1();
    try {
      if (int.parse(diamondUser!) >= int.parse(diamondGift)) {
        showDiaLogGift(
          context,
          "Thành công rồi",
          "Cảm ơn bạn đã sử dụng dịch vụ của Winpe Pay",
          GlobalVariables.imageSuccess,
        );

        var giftItem = await FirebaseFirestore.instance
            .collection('gifts')
            .doc(uidGift)
            .get();

        model.MyGift myGift = model.MyGift(
            uid: mygiftId,
            userId: uidUser,
            giftId: uidGift,
            status: true,
            gift: giftItem.data());

        //create table database mygifts in firestore
        await _firestore
            .collection("mygifts")
            .doc(mygiftId)
            .set(myGift.toJson());

        //update diamond user
        await _firestore.collection('users').doc(uidUser).update(
            {"diamond": int.parse(diamondUser) - int.parse(diamondGift)});
      } else {
        showDiaLogGift(
          context,
          "không đủ kim cương",
          "Vui lòng chọn những ưu đãi khác",
          GlobalVariables.imageError,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //fetch data my gifts with id user
  Future<void> fetchMyGift({
    required BuildContext context,
    required List? dataMyGift,
  }) async {
    try {
      var mygifts = await FirebaseFirestore.instance
          .collection('mygifts')
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      for (int i = 0; i < mygifts.docs.length; i++) {
        var giftItems = mygifts.docs[i];
        dataMyGift?.add(giftItems);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //update status MyGift
  Future<void> updateStatusMyGift({
    required BuildContext context,
    required String? uidMyGift,
  }) async {
    try {
      await _firestore
          .collection('mygifts')
          .doc(uidMyGift)
          .update({"status": false});
      Navigator.pushNamedAndRemoveUntil(
        context,
        GiftSuccess.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
