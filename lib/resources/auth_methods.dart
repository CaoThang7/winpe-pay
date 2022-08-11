import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/otp_screen.dart';
import 'package:winpe_pay/utils/utils.dart';
import 'package:translator/translator.dart';
import 'dart:async';
import 'package:winpe_pay/models/user.dart' as model;
import 'package:intl/intl.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationID = "";
  final translator = GoogleTranslator();

  // PHONE SIGN IN
  Future<void> phoneSignIn(
    BuildContext context,
    String phoneNumber,
  ) async {
    try {
      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = new RegExp(pattern);
      if (phoneNumber.isEmpty) {
        showSnackBar(context, "SĐT không được bỏ trống");
        return;
      } else if (!regExp.hasMatch(phoneNumber)) {
        showSnackBar(context, "SĐT không đúng định dạng");
        return;
      }
      // FOR ANDROID, IOS
      await _auth.verifyPhoneNumber(
        phoneNumber: "+1${phoneNumber}",
        //  Automatic handling of the SMS code
        verificationCompleted: (PhoneAuthCredential credential) async {
          // !!! works only on android !!!
          await _auth.signInWithCredential(credential);
        },
        // Displays a message when verification fails
        verificationFailed: (e) {
          // set languages vietnam for message error
          translator.translate(e.message!, from: 'en', to: 'vi').then((s) {
            print(s);
            showSnackBar(context, s.toString());
          });
        },
        // Displays a dialog box when OTP is sent
        codeSent: ((String verificationId, int? resendToken) async {
          verificationID = verificationId;
          showSnackBar(context, 'Nhập số  thành công');
          Timer(Duration(seconds: 5), () {
            Navigator.pushNamed(context, OtpScreen.routeName,
                arguments: verificationID);
          });
        }),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // verifyOTP
  Future<void> verifyOTP(
    BuildContext context,
    String otp,
    String verifiId,
  ) async {
    try {
      if (otp.isEmpty) {
        showSnackBar(context, "OTP không được bỏ trống");
        return;
      }
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifiId,
        smsCode: otp,
      );
      // !!! Works only on Android, iOS !!!
      await _auth.signInWithCredential(credential).then((value) async {
        showSnackBar(context, 'Bạn đã đăng nhập thành công');
        final User user = _auth.currentUser!;
        model.User _user = model.User(
          phone: user.phoneNumber.toString(),
          uid: user.uid,
          dateCreated: user.metadata.creationTime,
          dateSignedIn: DateTime.now(),
        );
        // adding user in our database
        await _firestore.collection("users").doc(user.uid).set(_user.toJson());
      }).onError(
          (error, stackTrace) => showSnackBar(context, 'Mã OTP không đúng'));
    } catch (e) {
      // showSnackBar(context, e.toString());
      print(e.toString());
    }
  }
}
