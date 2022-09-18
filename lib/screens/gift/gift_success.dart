import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/widgets/bottom_bar.dart';

class GiftSuccess extends StatefulWidget {
  static const String routeName = '/gift-success-screen';
  const GiftSuccess({Key? key}) : super(key: key);

  @override
  State<GiftSuccess> createState() => _GiftSuccessState();
}

class _GiftSuccessState extends State<GiftSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/images/smile.png",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sử dụng thành công",
              style: textNameDetailGift,
            ),
            Text(
              "Cảm ơn quý khách đã sử dụng thẻ quà tặng của Winpe Pay",
              style: textStandardBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    side: BorderSide(width: 2, color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      BottomBar.routeName,
                      (route) => false,
                    );
                  },
                  child: Text("Về trang chủ"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
