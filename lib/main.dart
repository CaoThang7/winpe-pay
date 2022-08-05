import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/splash/splash_screen.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'responsive/mobile_screen_layout.dart';
import 'responsive/responsive_layout.dart';

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
          scaffoldBackgroundColor: mobileBackgroundColor,
          colorScheme: const ColorScheme.light(
            primary: colorScheme,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: colorScheme,
            ),
          ),
          useMaterial3: true, // can remove this line
        ),
        home: ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
        ));
  }
}
