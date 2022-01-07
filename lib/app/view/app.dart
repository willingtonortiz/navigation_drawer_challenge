import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:navigation_drawer_challenge/app/pages/home_page.dart';
import 'package:navigation_drawer_challenge/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: const Color(0xffeff3f8),
        scaffoldBackgroundColor: const Color(0xffeff3f8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffeff3f8),
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
