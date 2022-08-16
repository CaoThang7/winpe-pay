import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/account/account_screen.dart';
import 'package:winpe_pay/screens/home/home_screen.dart';
import 'package:winpe_pay/screens/voucher/voucher_screen.dart';

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
}
