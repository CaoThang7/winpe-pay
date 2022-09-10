import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winpe_pay/resources/firestore_methods.dart';
import 'package:winpe_pay/screens/notification/widgets/app_bars.dart';
import 'package:winpe_pay/screens/notification/widgets/notification_card.dart';
import 'package:winpe_pay/screens/transaction/widgets/data_empty.dart';
import 'package:winpe_pay/widgets/loader.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notification-screen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
    getdataNotification();
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
    String res = await fireStoreMethods.checkDataNotification(context: context);
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

  void getdataNotification() async {
    var myNotification;
    var listNotification =
        await FirebaseFirestore.instance.collection('notifications').get();
    for (int i = 0; i < listNotification.docs.length; i++) {
      myNotification = listNotification.docs[i]['notificaItems'];
      for (int j = 0; j < myNotification.length; j++) {
        var transferItems = myNotification[j];
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
      appBar: AppBarNotification(context),
      body: _isLoading
          ? Loader()
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: vis
                  ? ListView.builder(
                      itemCount: result!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = result![index];
                        return NotificationCard(data: data);
                      })
                  : DataEmpty(text: "Chưa có thông báo mới nào")),
    );
  }
}
