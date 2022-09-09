import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';

class BelowAppBarDetails extends StatefulWidget {
  final dataTransaction;
  const BelowAppBarDetails({Key? key, required this.dataTransaction})
      : super(key: key);

  @override
  State<BelowAppBarDetails> createState() => _BelowAppBarDetailsState();
}

class _BelowAppBarDetailsState extends State<BelowAppBarDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.3, color: secondaryColor),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/credit-card.png",
            height: 30,
            width: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "${widget.dataTransaction['username']}",
            style: textPaymentSuccess,
          )
        ],
      ),
    );
  }
}
