import 'package:flutter/material.dart';
import 'package:winpe_pay/resources/auth_methods.dart';
import 'package:winpe_pay/screens/account/profile_screen.dart';
import 'package:winpe_pay/screens/account/widgets/app_bars.dart';
import 'package:winpe_pay/screens/account/widgets/setting_card.dart';
import 'package:winpe_pay/screens/card/winpe_card_screen.dart';
import 'package:winpe_pay/screens/gift/user_gift_screen.dart';
import 'package:winpe_pay/screens/notification/notification_screen.dart';
import 'package:winpe_pay/screens/transaction/transaction_screen.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:winpe_pay/widgets/loader.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isLoading = false;
  AuthMethods authMethods = AuthMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadingScreen();
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

  void logout() {
    authMethods.signOut(context);
  }

  void navigateSetting(var dataSettingsUser) {
    if (dataSettingsUser == '1') {
      Navigator.pushNamed(context, ProfileScreen.routeName);
    } else if (dataSettingsUser == '2') {
      Navigator.pushNamed(context, WinpeCardScreen.routeName);
    } else if (dataSettingsUser == '3') {
      Navigator.pushNamed(context, TransactionHistoryScreen.routeName);
    } else if (dataSettingsUser == '4') {
      Navigator.pushNamed(context, NotificationScreen.routeName);
    } else if (dataSettingsUser == '5') {
      Navigator.pushNamed(context, UserGiftScreen.routeName);
    } else if (dataSettingsUser == '6') {
      logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAccount(context),
      body: Container(
        child: _isLoading
            ? Loader()
            : ListView.builder(
                itemCount: GlobalVariables.userSettings.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var dataSettings = GlobalVariables.userSettings[index];
                  return GestureDetector(
                    onTap: () {
                      navigateSetting(dataSettings['id']);
                    },
                    child: SettingCard(dataSettings: dataSettings, index: index),
                  );
                },
              ),
      ),
    );
  }
}
