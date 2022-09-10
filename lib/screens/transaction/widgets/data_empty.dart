import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';

class DataEmpty extends StatefulWidget {
  final String text;
  const DataEmpty({Key? key, required this.text}) : super(key: key);

  @override
  State<DataEmpty> createState() => _DataEmptyState();
}

class _DataEmptyState extends State<DataEmpty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            "assets/images/wallet.png",
            height: 200,
            width: 200,
          ),
          Text(
            widget.text,
            style: textWelcomeBack,
          )
        ],
      ),
    );
  }
}
