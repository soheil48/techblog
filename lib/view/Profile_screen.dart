// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/my_String.dart';
import 'package:flutter_tech_blog/my_colors.dart';

import '../gen/assets.gen.dart';
import '../my_Conponent.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.texttheme,
    required this.bodymargin,
    required this.index,
  });

  final Size size;
  final TextTheme texttheme;
  final double bodymargin;
  final index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Image.asset(
            Assets.images.user.path,
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(Assets.icons.pencil.path),
                color: soildcolors.seemore,
              ),
              const SizedBox(width: 8),
              const Text(
                myString.editPicProfile,
                style: TextStyle(
                  color: soildcolors.seemore,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            'فاطمه امیری',
            style: texttheme.bodyLarge,
          ),
          const SizedBox(height: 5),
          Text(
            'fatemeamiri@gmail.com',
            style: texttheme.bodyLarge,
          ),
          const SizedBox(
            height: 40,
          ),
          myDivider(size: size)
        ],
      ),
    );
  }
}
