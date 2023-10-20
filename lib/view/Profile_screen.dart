// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/component/my_Conponent.dart';
import 'package:flutter_tech_blog/component/my_String.dart';
import 'package:flutter_tech_blog/component/my_colors.dart';

import '../gen/assets.gen.dart';

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
  // ignore: prefer_typing_uninitialized_variables
  final index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
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
                  color: SoildColors.seemore,
                ),
                const SizedBox(width: 8),
                const Text(
                  MyString.editPicProfile,
                  style: TextStyle(
                    color: SoildColors.seemore,
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
            MyDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SoildColors.primeryColor,
              child: SizedBox(
                height: 60,
                child: Center(
                  child: Text(
                    MyString.myFavtext,
                    style: texttheme.bodyLarge,
                  ),
                ),
              ),
            ),
            MyDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SoildColors.primeryColor,
              child: SizedBox(
                height: 60,
                child: Center(
                  child: Text(
                    MyString.myFavpadcast,
                    style: texttheme.bodyLarge,
                  ),
                ),
              ),
            ),
            MyDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SoildColors.primeryColor,
              child: SizedBox(
                height: 60,
                child: Center(
                  child: Text(
                    MyString.logout,
                    style: texttheme.bodyLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
