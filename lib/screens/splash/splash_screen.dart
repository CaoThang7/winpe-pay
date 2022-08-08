import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:winpe_pay/screens/home/home_screen.dart';
import 'package:winpe_pay/screens/login/login_screen.dart';
import 'package:winpe_pay/screens/splash/widgets/styles.dart';

import '../../utils/global_variable.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedSplashScreen(
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo app
                GlobalVariables.logoAppBig,
                SizedBox(
                  height: 20,
                ),
                // Name app
                Text("Winpe Pay", style: textApp)
              ],
            ),
            // nextScreen: HomeScreen(),
            nextScreen: LoginScreen(),
            backgroundColor: Colors.white,
            splashIconSize: 250,
            splashTransition: SplashTransition.fadeTransition,
            duration: 4000),
      ),
    );
  }
}
