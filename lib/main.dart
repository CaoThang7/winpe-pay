import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Winpe Pay',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(
            primary: Color.fromRGBO(255, 153, 0, 1),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          useMaterial3: true, // can remove this line
        ),
        home: const SplashScreen());
  }
}
