// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/component/my_colors.dart';
import 'package:flutter_tech_blog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tech_blog/view/main_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.a1.path,
              height: 64,
            ),
            const SpinKitThreeBounce(
              color: SoildColors.primeryColor,
              size: 25.0,
            ),
          ],
        ),
      ),
    ));
  }
}
