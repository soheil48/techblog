import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/gen/assets.gen.dart';
import 'package:flutter_tech_blog/my_colors.dart';

import 'Profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var texttheme = Theme.of(context).textTheme;
    double bodymargin = size.width / 10;
    var index;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: soildcolors.scafoldbg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.menu, color: Colors.black),
              Image.asset(
                Assets.images.a1.path,
                height: size.height / 13.6,
              ),
              const Icon(
                CupertinoIcons.search,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: ProfileScreen(
                size: size,
                texttheme: texttheme,
                bodymargin: bodymargin,
                index: index,
              ),
            ),
            BottomNavigation(size: size, bodymargin: bodymargin),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.bodymargin,
  });

  final Size size;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: gradiantColors.bottomNavbac,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodymargin, left: bodymargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: gradiantColors.bottomNav,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(Assets.icons.home.path),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(Assets.icons.content.path),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(Assets.icons.user.path),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
