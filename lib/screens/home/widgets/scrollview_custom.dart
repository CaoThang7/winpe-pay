import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winpe_pay/providers/user_provider.dart';
import 'package:winpe_pay/screens/home/widgets/app_bars.dart';
import 'package:winpe_pay/screens/home/widgets/sliverlist_custom.dart';
import 'package:winpe_pay/utils/colors.dart';

class ScrollViewCustom extends StatefulWidget {
  const ScrollViewCustom({Key? key}) : super(key: key);

  @override
  State<ScrollViewCustom> createState() => _ScrollViewCustomState();
}

class _ScrollViewCustomState extends State<ScrollViewCustom> {
  bool vis = false;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadingScreen();
  }

  _visibilityWidget() {
    setState(() {
      vis = !vis;
    });
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
    final uid = context.watch<UserProvider>().user;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBarCustom(uid, _visibilityWidget, vis),
        SliverListCustom(context, vis, _isLoading)
      ],
    );
  }
}
