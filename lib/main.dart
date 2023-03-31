import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vacua_app/models/users.dart';
import 'package:vacua_app/screens/SettingsPage.dart';
import 'package:vacua_app/screens/classRoomScreen.dart';
import 'components/pallete.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//screens

import 'package:vacua_app/screens/loginScreen.dart';
import 'screens/profileScreen.dart';

final localeProvider = StateProvider<Locale>((ref) {
  return window.locale.languageCode == 'fr'
      ? const Locale('fr', '')
      : const Locale('en', '');
});

final userProvider = StateProvider<UserModel?>((ref) => null);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.myPaletteLight,
        brightness: Brightness.light,
        textTheme: GoogleFonts.mcLarenTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        primarySwatch: Palette.myPaletteDark,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: ref.watch(localeProvider),
      home: const ClassRooms(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
final isDarkModeProvider = Provider<bool>((ref) {
  final themeMode = ref.watch(themeModeProvider);
  return themeMode == ThemeMode.dark;
});
