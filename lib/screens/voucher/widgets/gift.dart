import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winpe_pay/resources/firestore_methods.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/screens/voucher/voucher_detail.dart';
import 'package:winpe_pay/screens/voucher/widgets/gift_card.dart';
import 'package:winpe_pay/screens/voucher/widgets/gift_card_skelton.dart';
import 'package:winpe_pay/utils/colors.dart';

class Gift extends StatefulWidget {
  const Gift({Key? key}) : super(key: key);

  @override
  State<Gift> createState() => _GiftState();
}

class _GiftState extends State<Gift> {
  bool _isLoading = false;
  FireStoreMethods fireStoreMethods = FireStoreMethods();
  List? giftTT = [];
  List? giftHOT = [];

  @override
  void initState() {
    super.initState();
    loadingScreen();
    fetchGiftTT(giftTT, giftHOT);
  }

  void loadingScreen() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      if (this.mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void fetchGiftTT(var resultGift, var resultGiftHot) async {
    fireStoreMethods.fetchGift(
        context: context, giftTT: resultGift, giftHOT: resultGiftHot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(left: 10, top: 20),
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    "Ưu đãi mùa trung thu",
                    style: textStandardBold,
                  )),
              Container(
                height: 230,
                child: _isLoading
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) =>
                            const GiftCardSkelton(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: giftTT!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dataGift = giftTT![index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  VoucherDetail.routeName,
                                  arguments: dataGift,
                                );
                              },
                              child: GiftCard(dataGift: dataGift));
                        }),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    "Ưu đãi HOT",
                    style: textStandardBold,
                  )),
              Container(
                height: 230,
                child: _isLoading
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) =>
                            const GiftCardSkelton(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: giftHOT!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dataGift = giftHOT![index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  VoucherDetail.routeName,
                                  arguments: dataGift,
                                );
                              },
                              child: GiftCard(dataGift: dataGift));
                        }),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
