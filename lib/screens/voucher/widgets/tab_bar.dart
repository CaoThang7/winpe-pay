import 'package:flutter/material.dart';
import 'package:winpe_pay/utils/colors.dart';

class TabBarCustom extends StatelessWidget {
  const TabBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      child: TabBar(
        indicatorWeight: 4,
        tabs: [
          Tab(
            text: "Quà tặng",
          ),
          Tab(
            text: "Quà tặng của tôi",
          ),
        ],
      ),
    );
  }
}
