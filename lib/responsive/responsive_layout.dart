import 'package:flutter/material.dart';
import 'package:winpe_pay/resources/auth_methods.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget mobileScreenLayout;
  const ResponsiveLayout({
    Key? key,
    required this.mobileScreenLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authMethods.getUserDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return widget.mobileScreenLayout;
    });
  }
}
