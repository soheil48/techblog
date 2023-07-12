import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tech_blog/gen/assets.gen.dart';
import 'package:flutter_tech_blog/my_String.dart';
import 'package:flutter_tech_blog/my_colors.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techbot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyString.welcome,
                    style: texttheme.bodyMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: SizedBox(
                  height: 49,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('بزن بریم'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
