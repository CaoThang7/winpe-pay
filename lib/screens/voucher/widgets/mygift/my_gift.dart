import 'package:flutter/material.dart';
import 'package:winpe_pay/resources/firestore_methods.dart';
import 'package:winpe_pay/screens/transaction/widgets/data_empty.dart';
import 'package:winpe_pay/screens/voucher/voucher_detail.dart';
import 'package:winpe_pay/screens/voucher/widgets/mygift/my_gift_card.dart';
import 'package:winpe_pay/widgets/loader.dart';

class MyGift extends StatefulWidget {
  const MyGift({Key? key}) : super(key: key);

  @override
  State<MyGift> createState() => _MyGiftState();
}

class _MyGiftState extends State<MyGift> {
  FireStoreMethods fireStoreMethods = FireStoreMethods();
  List? myGift = [];
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadingScreen();
    fetchMyGift(myGift);
  }

  void LoadingScreen() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      if (this.mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void fetchMyGift(var resultMyGift) async {
    fireStoreMethods.fetchMyGift(context: context, dataMyGift: resultMyGift);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Container(
              height: 550,
              padding: EdgeInsets.only(bottom: 20),
              child: _isLoading
                  ? Loader()
                  : myGift!.length == 0
                      ? DataEmpty(
                          text: "Chưa có quà tặng mới nào",
                        )
                      : ListView.builder(
                          itemCount: myGift!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final dataGift = myGift![index];
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    VoucherDetail.routeName,
                                    arguments: dataGift['gift'],
                                  );
                                },
                                child: MyGiftCard(dataGift: dataGift));
                          }),
            )
          ],
        ),
      ),
    );
  }
}
