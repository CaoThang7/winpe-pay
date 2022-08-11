import 'package:flutter/material.dart';
import 'package:winpe_pay/router/router.dart';
import 'package:winpe_pay/screens/splash/splash_screen.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'responsive/mobile_screen_layout.dart';
import 'responsive/responsive_layout.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        title: 'Winpe Pay App',
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
        onGenerateRoute: (settings) => generateRoute(settings),
        home: ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
        ));
  }
}
