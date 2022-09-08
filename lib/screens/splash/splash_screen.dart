import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:winpe_pay/screens/home/home_screen.dart';
import 'package:winpe_pay/screens/login/login_screen.dart';
import 'package:winpe_pay/screens/splash/widgets/styles.dart';
import 'package:winpe_pay/widgets/bottom_bar.dart';
import 'package:winpe_pay/widgets/loader.dart';

import '../../utils/global_variable.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash-screen';
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
                Text(
                  "Winpe Pay",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arsenal-Bold',
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                )
              ],
            ),
            nextScreen: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  // Checking if the snapshot has any data or not
                  if (snapshot.hasData) {
                    // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                    return const BottomBar();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                }
                // means connection to future hasnt been made yet
                if (snapshot.connectionState == ConnectionState.waiting) {
                  Loader();
                }
                return const LoginScreen();
              },
            ),
            backgroundColor: Colors.white,
            splashIconSize: 250,
            splashTransition: SplashTransition.fadeTransition,
            duration: 4000),
      ),
    );
  }
}
