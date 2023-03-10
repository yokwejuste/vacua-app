import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'components/pallete.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//screens

import 'package:vacua_app/screens/loginScreen.dart';
import 'screens/profileScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.myPaletteLight,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Palette.myPaletteDark,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MyApp(),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/launcher_bg.png'),
      ),
    );
  }
}
