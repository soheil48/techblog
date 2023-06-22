import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tech_blog/view/main_Screen.dart';
import 'package:flutter_tech_blog/my_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MainScreen(),
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
              color: soildcolors.primeryColor,
              size: 25.0,
            ),
          ],
        ),
      ),
    ));
  }
}
