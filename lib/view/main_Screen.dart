// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/component/api_constant.dart';
import 'package:flutter_tech_blog/component/my_Conponent.dart';
import 'package:flutter_tech_blog/component/my_String.dart';
import 'package:flutter_tech_blog/component/my_colors.dart';
import 'package:flutter_tech_blog/controller/home_screen_controller.dart';
import 'package:flutter_tech_blog/gen/assets.gen.dart';
import 'package:flutter_tech_blog/services/dio_services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import 'Profile_screen.dart';
import 'home_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  RxInt Selectedindexpage = 0.obs;

  MainScreen({super.key});

  Homescreencontroller homescreencontroller = Get.put(Homescreencontroller());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var texttheme = Theme.of(context).textTheme;
    double bodymargin = size.width / 10;
    // ignore: prefer_typing_uninitialized_variables
    var index;
    homescreencontroller.getHomeItemes();
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SoildColors.scafoldbg,
          child: Padding(
            padding: EdgeInsets.only(right: bodymargin, left: bodymargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(Assets.images.a1.path, scale: 7),
                  ),
                ),
                ListTile(
                  title: Text(
                    'پروفایل کاربری',
                    style: texttheme.labelLarge,
                  ),
                ),
                const Divider(
                  color: SoildColors.dvider,
                ),
                ListTile(
                  title: Text(
                    'درباره تک‌بلاگ',
                    style: texttheme.labelLarge,
                  ),
                ),
                const Divider(
                  color: SoildColors.dvider,
                ),
                ListTile(
                  title: Text(
                    'اشتراک گذاری تک بلاگ',
                    style: texttheme.labelLarge,
                  ),
                  onTap: (() async {
                    await Share.share(MyString.sharetext);
                  }),
                ),
                const Divider(
                  color: SoildColors.dvider,
                ),
                ListTile(
                  title: Text(
                    'تک‌بلاگ در گیت هاب',
                    style: texttheme.labelLarge,
                  ),
                  onTap: (() {
                    mylaunchurl(MyString.techblogiturl);
                  }),
                ),
                const Divider(
                  color: SoildColors.dvider,
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SoildColors.scafoldbg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
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
              child: Obx(
                () {
                  return IndexedStack(
                    index: Selectedindexpage.value,
                    children: [
                      homeScreen(
                        size: size,
                        texttheme: texttheme,
                        bodymargin: bodymargin,
                        index: index,
                      ),
                      ProfileScreen(
                        size: size,
                        texttheme: texttheme,
                        bodymargin: bodymargin,
                        index: index,
                      ),
                    ],
                  );
                },
              ),
            ),
            BottomNavigation(
              size: size,
              bodymargin: bodymargin,
              changeScreen: (int value) {
                Selectedindexpage.value = value;
              },
            ),
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
    required this.changeScreen,
  });

  final Size size;
  final double bodymargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomNavbac,
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
                colors: GradiantColors.bottomNav,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
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
                  onPressed: () => changeScreen(1),
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
