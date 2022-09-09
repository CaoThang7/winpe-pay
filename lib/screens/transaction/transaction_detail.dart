import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/transaction/widgets/app_bars.dart';
import 'package:winpe_pay/screens/transaction/widgets/below_appbar_details.dart';
import 'package:winpe_pay/screens/transaction/widgets/transaction%20_infor.dart';
import 'package:winpe_pay/screens/transaction/widgets/transaction_status.dart';

class TransactionDetail extends StatefulWidget {
  static const String routeName = '/transaction-details-screen';
  final dataTransaction;
  const TransactionDetail({Key? key, required this.dataTransaction})
      : super(key: key);

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTransactionDetail(context),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BelowAppBarDetails(dataTransaction: widget.dataTransaction),
              TransactionStatus(dataTransaction: widget.dataTransaction),
              TransactionInfor(dataTransaction: widget.dataTransaction),
            ],
          ),
        ));
  }
}
