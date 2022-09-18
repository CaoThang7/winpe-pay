import 'package:flutter/material.dart';
import 'package:winpe_pay/utils/colors.dart';

class TabBarGiftCustom extends StatelessWidget {
  const TabBarGiftCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      child: TabBar(
        indicatorWeight: 4,
        tabs: [
          Tab(
            text: "Chưa sử dụng",
          ),
          Tab(
            text: "Đã sử dụng",
          ),
        ],
      ),
    );
  }
}
