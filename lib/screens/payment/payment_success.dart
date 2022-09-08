import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:lottie/lottie.dart';
import 'package:winpe_pay/widgets/bottom_bar.dart';

class PaymentSuccess extends StatefulWidget {
  static const String routeName = '/payment-success';
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 70),
      child: Column(
        children: [
          Lottie.network(
            GlobalVariables().paymentSuccess,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Giao dịch thành công",
            style: textPaymentSuccess,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Cảm ơn quý khách đã sử dụng dịch vụ Winpe Pay",
            style: textStandard,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                BottomBar.routeName,
                (route) => false,
              );
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: mobileBackgroundColor,
            ),
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              shape: CircleBorder(),
              padding: EdgeInsets.all(18),
            ),
          )
        ],
      ),
    ));
  }
}
