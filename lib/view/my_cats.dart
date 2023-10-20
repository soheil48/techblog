import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tech_blog/component/my_Conponent.dart';
import 'package:flutter_tech_blog/component/my_String.dart';
import 'package:flutter_tech_blog/component/my_colors.dart';
import 'package:flutter_tech_blog/gen/assets.gen.dart';
import 'package:flutter_tech_blog/models/data_model.dart';
import 'package:flutter_tech_blog/models/fake_data.dart';

import '../gen/assets.gen.dart';

class mycats extends StatefulWidget {
  @override
  State<mycats> createState() => _mycatsState();
}

class _mycatsState extends State<mycats> {
  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodymargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SvgPicture.asset(
                  Assets.images.techbot.path,
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                MyString.welcomeLogin,
                style: texttheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(right: bodymargin, left: bodymargin),
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: 'نام و نام خانوادگی'),
                  style: TextStyle(color: SoildColors.dvider),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                MyString.choosecatgory,
                style: texttheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 85,
                  child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: taglist.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.3,
                    ),
                    itemBuilder: (Context, index) {
                      return InkWell(
                        onTap: () {
                          setState(
                            () {
                              if (!selectedtags.contains(taglist[index])) {
                                selectedtags.add(taglist[index]);
                              }
                            },
                          );
                        },
                        child: maintags(
                          texttheme: texttheme,
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Image.asset(
                Assets.images.arrowdown.path,
                scale: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 85,
                  child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: selectedtags.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.3,
                    ),
                    itemBuilder: (Context, index) {
                      return Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 227, 227, 227),
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                selectedtags[index].title,
                                style: texttheme.bodyLarge,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedtags.removeAt(index);
                                  });
                                },
                                child: const Icon(
                                  CupertinoIcons.trash,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
