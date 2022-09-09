import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class TransactionStatus extends StatefulWidget {
  final dataTransaction;
  const TransactionStatus({Key? key, required this.dataTransaction})
      : super(key: key);

  @override
  State<TransactionStatus> createState() => _TransactionStatusState();
}

class _TransactionStatusState extends State<TransactionStatus> {
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trạng thái",
                  style: textPaymentDetail,
                ),
                Text(
                  "Thành công",
                  style: textStandardBlack,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Số tiền",
                  style: textPaymentDetail,
                ),
                Text(
                  "${widget.dataTransaction['money'].toString().toVND()}",
                  style: textStandardBold,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phí giao dịch",
                  style: textPaymentDetail,
                ),
                Text(
                  "Miễn phí",
                  style: textStandardBlack,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nguồn tiền",
                  style: textPaymentDetail,
                ),
                Text(
                  "Winpe Pay",
                  style: textStandardBlack,
                )
              ],
            ),
          ],
        ));
  }
}
