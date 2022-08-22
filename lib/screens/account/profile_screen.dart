import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/account/widgets/app_bars.dart';
import 'package:winpe_pay/screens/account/widgets/profile_card.dart';
import 'package:winpe_pay/widgets/loader.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    LoadingScreen();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarProfile(context),
        body: _isLoading ? Loader() : ProfileCard());
  }
}
