import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/voucher/widgets/detail/detail_card.dart';

class VoucherDetail extends StatefulWidget {
  static const String routeName = '/voucher-detail-screen';
  final dataGift;
  const VoucherDetail({Key? key, required this.dataGift}) : super(key: key);

  @override
  State<VoucherDetail> createState() => _VoucherDetailState();
}

class _VoucherDetailState extends State<VoucherDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailCard(dataGift: widget.dataGift)
    );
  }
}
