import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:winpe_pay/screens/home/home_screen.dart';

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
                Image.asset(
                  'assets/images/arctic-fox.jpg',
                  height: 150,
                  width: 150,
                ),
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
            nextScreen: HomeScreen(),
            backgroundColor: Colors.white,
            splashIconSize: 250,
            splashTransition: SplashTransition.fadeTransition,
            duration: 4000),
      ),
    );
  }
}
