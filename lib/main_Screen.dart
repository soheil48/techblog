import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tech_blog/my_colors.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            children: [
              //header app
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.menu),
                  Image.asset(
                    Assets.images.a1.path,
                    height: size.height / 13.6,
                  ),
                  const Icon(
                    CupertinoIcons.search,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Stack(
                children: [
                  Container(
                    height: size.height / 4.2,
                    width: size.width / 1.19,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      image: DecorationImage(
                          image: AssetImage(Assets.images.programming.path),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: size.height / 4.2,
                    width: size.width / 1.19,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      gradient: LinearGradient(
                          colors: gradiantColors.homePosterCover,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
