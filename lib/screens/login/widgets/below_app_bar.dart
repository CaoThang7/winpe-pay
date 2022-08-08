import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/global_variable.dart';

class BelowAppBar extends StatefulWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  State<BelowAppBar> createState() => _BelowAppBarState();
}

class _BelowAppBarState extends State<BelowAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Winpe xin chào!",
                  style: textLogin,
                ),
                Text(
                  "Chào bạn quay lại",
                  style: textWelcomeBack,
                )
              ],
            ),
          ),
          GlobalVariables.logoAppBig
        ],
      ),
    );
  }
}
