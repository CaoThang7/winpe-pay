import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winpe_pay/providers/user_provider.dart';
import 'package:winpe_pay/resources/firestore_methods.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/screens/payment/widgets/app_bars.dart';
import 'package:winpe_pay/screens/payment/widgets/text_form_payment.dart';
import 'package:winpe_pay/screens/payment/widgets/validate.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/utils.dart';
import 'package:winpe_pay/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = '/payment-screen';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _stkController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FireStoreMethods fireStoreMethods = FireStoreMethods();
  bool vis = false;
  String uidUser = '';
  String accNo = '';
  String username = '';
  int moneyUser = 0;
  final globalkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //search accNo and get data user search
  void queryDataUser(String? text, String? accNoUser) async {
    var listUser = await _firestore
        .collection('users')
        .where('accNo', isEqualTo: text)
        .get();
    for (int i = 0; i < listUser.docs.length; i++) {
      setState(() {
        uidUser = listUser.docs[i]['uid'];
        accNo = listUser.docs[i]['accNo'];
        username = listUser.docs[i]['username'];
        moneyUser = listUser.docs[i]['money'];
      });
    }
    if (_stkController.text == accNoUser) {
      showSnackBar(
          context, 'Bạn vui lòng chọn tài khoản nhận khác với tài khoản nguồn');
    }
    if (accNo == text) {
      setState(() {
        vis = true;
      });
    } else {
      setState(() {
        vis = false;
      });
    }
  }

  //transfer
  void transfer(
      String? uidSender, String? account_money, int? moneyReceiver) async {
    if (globalkey.currentState!.validate()) {
      fireStoreMethods.transfer(
          context: context,
          uidSender: uidSender!,
          uidreceiver: uidUser,
          money: _moneyController.text,
          content: _contentController.text,
          account_money: account_money!,
          moneyReceiver: moneyReceiver!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final uid = context.watch<UserProvider>().user;
    return Scaffold(
      appBar: AppBarPayment(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: mobileBackgroundColorGrey,
          child: Form(
            key: globalkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Chuyển đến",
                  style: textTitlePayment,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormPayment(
                  usernameController: _usernameController,
                  stkController: _stkController,
                  moneyController: _moneyController,
                  contentController: _contentController,
                  onchange: (String? text) {
                    queryDataUser(text!, uid?.accNo);
                  },
                  vis: vis,
                  username: username,
                  valid_accNo: validAccNo,
                  valid_money: validMoney,
                  valid_content: validContent,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: 'Tiếp tục',
                  onTap: () {
                    transfer(uid?.uid, uid?.money.toString(), moneyUser);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
