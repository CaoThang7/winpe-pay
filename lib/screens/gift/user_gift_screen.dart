import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/gift/widgets/app_bars.dart';
import 'package:winpe_pay/screens/gift/widgets/tab_bar_gift.dart';
import 'package:winpe_pay/screens/gift/widgets/tab_bar_gift_view.dart';
import 'package:winpe_pay/utils/colors.dart';

class UserGiftScreen extends StatefulWidget {
  static const String routeName = '/user-gift-screen';
  const UserGiftScreen({Key? key}) : super(key: key);

  @override
  State<UserGiftScreen> createState() => _UserGiftScreenState();
}

class _UserGiftScreenState extends State<UserGiftScreen> {
  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: mobileBackgroundColorGrey,
          appBar: AppBarMyGift(context),
          body: Column(
            children: [
              TabBarGiftCustom(), 
              TabBarGiftViewCustom()
            ],
          )),
    );
  }
}