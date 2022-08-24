import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/card/widgets/app_bars.dart';
import 'package:winpe_pay/screens/card/widgets/card_winpe.dart';
import 'package:winpe_pay/widgets/loader.dart';

class WinpeCardScreen extends StatefulWidget {
  static const String routeName = '/winpe-card-screen';
  const WinpeCardScreen({Key? key}) : super(key: key);

  @override
  State<WinpeCardScreen> createState() => _WinpeCardScreenState();
}

class _WinpeCardScreenState extends State<WinpeCardScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadingScreen();
  }

  void LoadingScreen() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 4), () {
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
        appBar: AppBarWinpeCard(context),
        body: Container(
          child: _isLoading ? LoaderLottie() : CardWinpe(),
        ));
  }
}
