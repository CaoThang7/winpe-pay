import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/voucher/widgets/mygift/my_gift.dart';

class MyGiftScreen extends StatefulWidget {
  const MyGiftScreen({Key? key}) : super(key: key);

  @override
  State<MyGiftScreen> createState() => _MyGiftScreenState();
}

class _MyGiftScreenState extends State<MyGiftScreen> {
  @override
  Widget build(BuildContext context) {
    return MyGift();
  }
}
