import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app/translations.dart';
import 'home_page.dart';
import 'login.dart';
import 'signup.dart';

void main() {
  runApp(MyApp(
    supportedLocales: [
      Locale('en', 'US'), // English (United States)
      Locale('fr', 'FR'), // French (France)
      Locale('ja', 'JP'),
      Locale('vi', 'VI'),
      Locale('es', 'ES')
      // Add more locales as needed
    ],
  ));
}

class MyApp extends StatefulWidget {
  final List<Locale> supportedLocales;

  // Constructor to initialize the supportedLocales property
  MyApp({required this.supportedLocales}); 

  @override
  _MyAppState createState() => _MyAppState();

  // Add a static method to change the app's locale
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.changeLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  // Method to change the app's locale
  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Login UI", 
      debugShowCheckedModeBanner: false,
      // Add the following lines for localization support
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: widget.supportedLocales, // Use the supportedLocales from MyApp
      locale: _locale, // Set the app's locale here
      // End of localization lines
      home: LoginScreen(supportedLocales: widget.supportedLocales), // Pass supportedLocales to LoginScreen
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(supportedLocales: widget.supportedLocales), // Pass supportedLocales to LoginScreen
        'signup': (context) => SignUpScreen(),
         '/home': (context) => HomePage(),
      }, 
    );
  }
}