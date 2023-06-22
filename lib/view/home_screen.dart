// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/my_String.dart';
import 'package:flutter_tech_blog/my_colors.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Column(
          children: [
            homepageposter(size: size, texttheme: texttheme),
            const SizedBox(
              height: 16,
            ),
            homepagetaglist(bodymargin: bodymargin, texttheme: texttheme),
            const SizedBox(
              height: 32,
            ),
            SeeMoreBlog(index: index, bodymargin: bodymargin),
            homePageBlogList(
                size: size, bodymargin: bodymargin, texttheme: texttheme),
            const SizedBox(
              height: 32,
            ),
            SeeMorePadcast(index: index, bodymargin: bodymargin),
            homePagePadcastList(size: size, bodymargin: bodymargin),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}

class homePagePadcastList extends StatelessWidget {
  const homePagePadcastList({
    super.key,
    required this.size,
    required this.bodymargin,
  });

  final Size size;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: padList.getRange(0, 4).length,
        itemBuilder: (BuildContext, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodymargin : 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 3.0,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(
                                padList[index].imageurl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: size.width / 3,
                  child: Text(
                    padList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SeeMorePadcast extends StatelessWidget {
  const SeeMorePadcast({
    super.key,
    required this.index,
    required this.bodymargin,
  });

  final index;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodymargin : 30, 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.mic.path),
            color: soildcolors.seemore,
          ),
          const SizedBox(width: 8),
          const Text(
            myString.viewHotestpadcast,
            style: TextStyle(
              color: soildcolors.seemore,
            ),
          ),
        ],
      ),
    );
  }
}

class homePageBlogList extends StatelessWidget {
  const homePageBlogList({
    super.key,
    required this.size,
    required this.bodymargin,
    required this.texttheme,
  });

  final Size size;
  final double bodymargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bloglist.getRange(0, 4).length,
        itemBuilder: (BuildContext, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodymargin : 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.2,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(bloglist[index].imageurl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: const LinearGradient(
                              colors: gradiantColors.blogpost,
                              begin: AlignmentDirectional.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 0,
                          left: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(bloglist[index].writer,
                                  style: texttheme.titleMedium),
                              Row(
                                children: [
                                  Text(
                                    bloglist[index].view,
                                    style: texttheme.titleMedium,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.remove_red_eye,
                                    color: soildcolors.scafoldbg,
                                    size: 17,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.2,
                  child: Text(
                    bloglist[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.index,
    required this.bodymargin,
  });

  final index;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodymargin : 30, 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.pencil.path),
            color: soildcolors.seemore,
          ),
          const SizedBox(width: 8),
          const Text(
            myString.viewHotestBlog,
            style: TextStyle(
              color: soildcolors.seemore,
            ),
          )
        ],
      ),
    );
  }
}

class homepagetaglist extends StatelessWidget {
  const homepagetaglist({
    super.key,
    required this.bodymargin,
    required this.texttheme,
  });

  final double bodymargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: taglist.length,
        itemBuilder: (BuildContext, index) {
          return Padding(
            padding:
                EdgeInsets.fromLTRB(0, 11, index == 0 ? bodymargin : 10, 11),
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                gradient: LinearGradient(
                    colors: gradiantColors.tag,
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(Assets.icons.hashtag.path),
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      taglist[index].title,
                      style: texttheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class homepageposter extends StatelessWidget {
  const homepageposter({
    super.key,
    required this.size,
    required this.texttheme,
  });

  final Size size;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height / 4.2,
          width: size.width / 1.19,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            image: DecorationImage(
                image: homepageposterMap['imageAsset'], fit: BoxFit.cover),
          ),
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            gradient: LinearGradient(
                colors: gradiantColors.homePosterCover,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homepageposterMap['writer'] +
                        ' - ' +
                        homepageposterMap['date'],
                    style: texttheme.titleMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        homepageposterMap['view'],
                        style: texttheme.titleMedium,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.remove_red_eye,
                        color: soildcolors.scafoldbg,
                        size: 17,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'دوازده قدم برای برنامه نویس یک دوره ...',
                style: texttheme.displayLarge,
              ),
            ],
          ),
        )
      ],
    );
  }
}
