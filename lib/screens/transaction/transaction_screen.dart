import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winpe_pay/resources/firestore_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winpe_pay/screens/transaction/transaction_detail.dart';
import 'package:winpe_pay/screens/transaction/widgets/app_bars.dart';
import 'package:winpe_pay/screens/transaction/widgets/data_empty.dart';
import 'package:winpe_pay/screens/transaction/widgets/transaction_card.dart';
import 'package:winpe_pay/widgets/loader.dart';

class TransactionHistoryScreen extends StatefulWidget {
  static const String routeName = '/transaction-history-screen';
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  FireStoreMethods fireStoreMethods = FireStoreMethods();
  bool vis = false;
  bool _isLoading = false;
  List? result = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadingScreen();
    checkData();
    getdataTransaction();
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

  void checkData() async {
    String res = await fireStoreMethods.checkDataTransaction(context: context);
    if (res == 'success') {
      setState(() {
        vis = true;
      });
    } else {
      setState(() {
        vis = false;
      });
    }
  }

  void getdataTransaction() async {
    var myTransaction;
    var listTransaction =
        await FirebaseFirestore.instance.collection('transfer').get();
    for (int i = 0; i < listTransaction.docs.length; i++) {
      myTransaction = listTransaction.docs[i]['transferItems'];
      for (int j = 0; j < myTransaction.length; j++) {
        var transferItems = myTransaction[j];
        if (transferItems['uidSender'] ==
                FirebaseAuth.instance.currentUser!.uid ||
            transferItems['uidreceiver'] ==
                FirebaseAuth.instance.currentUser!.uid) {
          setState(() {
            result!.add(transferItems);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTransactionHistory(context),
      body: _isLoading
          ? Loader()
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: vis
                  ? ListView.builder(
                      itemCount: result!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = result![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              TransactionDetail.routeName,
                              arguments: data,
                            );
                          },
                          child: TransactionCard(
                            data: data,
                          ),
                        );
                      })
                  : DataEmpty()),
    );
  }
}
