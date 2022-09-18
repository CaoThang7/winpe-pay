import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/voucher/my_gift_screen.dart';
import 'package:winpe_pay/screens/voucher/widgets/gift.dart';

class TabBarViewCustom extends StatefulWidget {
  const TabBarViewCustom({Key? key}) : super(key: key);

  @override
  State<TabBarViewCustom> createState() => _TabBarViewCustomState();
}

class _TabBarViewCustomState extends State<TabBarViewCustom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TabBarView(
      children: [
        Gift(),
        MyGiftScreen()
      ],
    ));
  }
}
