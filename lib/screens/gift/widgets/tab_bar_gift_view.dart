import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/gift/widgets/gift_unuse.dart';
import 'package:winpe_pay/screens/gift/widgets/gift_use.dart';
import 'package:winpe_pay/screens/voucher/my_gift_screen.dart';
import 'package:winpe_pay/screens/voucher/widgets/gift.dart';

class TabBarGiftViewCustom extends StatefulWidget {
  const TabBarGiftViewCustom({Key? key}) : super(key: key);

  @override
  State<TabBarGiftViewCustom> createState() => _TabBarGiftViewCustomState();
}

class _TabBarGiftViewCustomState extends State<TabBarGiftViewCustom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TabBarView(
      children: [
        GiftUnUse(), 
        GiftUse()
      ],
    ));
  }
}
