import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_tech_blog/view/Splash_screen.dart';
import 'package:flutter_tech_blog/my_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: soildcolors.statusBarcolor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: soildcolors.systemNavigationBarIconBrightness,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // farsi
      ],
      theme: ThemeData(
        fontFamily: 'dana',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'dana',
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: soildcolors.postertitle),
          bodyLarge: TextStyle(
              fontFamily: 'dana',
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.black),
          displayMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black),
          displaySmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black),
          headlineMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black),
          titleMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: soildcolors.postersubtitle),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
