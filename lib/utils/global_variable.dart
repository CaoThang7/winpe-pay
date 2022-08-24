import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/account/account_screen.dart';
import 'package:winpe_pay/screens/home/home_screen.dart';
import 'package:winpe_pay/screens/voucher/voucher_screen.dart';
import 'dart:math';

class GlobalVariables {
  static var logoAppBig = Image.asset(
    'assets/images/arctic-fox.jpg',
    height: 150,
    width: 150,
  );

  static List<Widget> homeScreenItems = [
    const HomeScreen(),
    const VoucherScreen(),
    const AccountScreen(),
  ];

  static const List<Map<String, String>> userSettings = [
    {
      'id': '1',
      'title': 'Tài khoản Winpe Pay',
      'image': 'assets/images/user.png',
    },
    {
      'id': '2',
      'title': 'Thẻ Winpe Pay',
      'image': 'assets/images/arctic-fox.jpg',
    },
    {
      'id': '3',
      'title': 'Lịch sử giao dịch',
      'image': 'assets/images/clock.png',
    },
    {
      'id': '4',
      'title': 'Thông báo',
      'image': 'assets/images/bell.png',
    },
    {
      'id': '5',
      'title': 'Ưu đãi của tôi',
      'image': 'assets/images/hot-sale.png',
    },
  ];

  String avatarProfile = "https://i.stack.imgur.com/l60Hf.png";

  String loadingLottie = "https://assets6.lottiefiles.com/packages/lf20_lb3jx6jr.json";

  String? accountNo() {
    final length = 13;
    final numbers = '0123456789';

    String chars = '';
    chars += '$numbers';

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);

      return chars[indexRandom];
    }).join('');
  }

  String? ifscCode() {
    final length = 11;
    final lettersLowercase = 'abcdefghijklmnopqrstuvwxyz';
    final lettersUppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final numbers = '0123456789';

    String chars = '';
    chars += '$lettersLowercase$lettersUppercase$numbers';

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);

      return chars[indexRandom];
    }).join('');
  }

  static const List<Map<String, String>> reasonuseWinpeCard = [
    {
      'id': '1',
      'title': 'Miễn phí rút tiền ATM',
      'image': 'assets/images/arctic-fox.jpg',
    },
    {
      'id': '2',
      'title': 'Miễn phí thanh toán tại quầy qua POS',
      'image': 'assets/images/arctic-fox.jpg',
    },
    {
      'id': '3',
      'title': 'Miễn phí phát hành',
      'image': 'assets/images/arctic-fox.jpg',
    },
  ];
}
