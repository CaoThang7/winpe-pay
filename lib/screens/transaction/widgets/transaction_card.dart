import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class TransactionCard extends StatefulWidget {
  final data;
  const TransactionCard({Key? key, required this.data}) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(widget.data['dateCreated'].toDate().toString());
    String dateCreated = DateFormat('MM/dd/yyyy hh:mm').format(date);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 90,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.3, color: secondaryColor),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 0,
                child: Image.asset(
                  "assets/images/credit-card.png",
                  height: 30,
                  width: 30,
                )),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.data['username']}', style: textTitlePayment),
                    Text('${dateCreated}'),
                    Text(
                      '${widget.data['content']}',
                      style: textStandard,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 0,
                child: Text('${widget.data['money'].toString().toVND()}',
                    style: textTitlePayment)),
          ],
        ));
  }
}
