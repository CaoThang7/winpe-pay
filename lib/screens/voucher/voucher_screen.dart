import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/screens/voucher/widgets/app_bars.dart';
import 'package:winpe_pay/screens/voucher/widgets/tab_bar.dart';
import 'package:winpe_pay/screens/voucher/widgets/tab_bar_view.dart';
import 'package:winpe_pay/utils/colors.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: mobileBackgroundColorGrey,
          appBar: AppBarVoucher(context),
          body: Column(
            children: [
              TabBarCustom(), 
              TabBarViewCustom()
            ],
          )),
    );
  }
}
