// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tech_blog/component/my_Conponent.dart';
import 'package:flutter_tech_blog/component/my_String.dart';
import 'package:flutter_tech_blog/component/my_colors.dart';
import 'package:flutter_tech_blog/controller/home_screen_controller.dart';
import 'package:flutter_tech_blog/models/padcast_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';

class homeScreen extends StatelessWidget {
  homeScreen({
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

  Homescreencontroller homescreencontroller = Get.put(Homescreencontroller());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: homescreencontroller.loading.value == false
              ? Column(
                  children: [
                    poster(
                      size: size,
                      texttheme: texttheme,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    homepagetaglist(
                      bodymargin: bodymargin,
                      texttheme: texttheme,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SeeMoreBlog(
                      index: index,
                      bodymargin: bodymargin,
                    ),
                    topvisited(
                      size: size,
                      bodymargin: bodymargin,
                      texttheme: texttheme,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SeeMorePadcast(
                      index: index,
                      bodymargin: bodymargin,
                    ),
                    topPodcast(
                      size: size,
                      bodymargin: bodymargin,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                )
              : const loading(),
        ),
      ),
    );
  }

  Widget topvisited({
    required Size size,
    required double bodymargin,
    required TextTheme texttheme,
  }) {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homescreencontroller.topVisitedlist.length,
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
                                image: NetworkImage(homescreencontroller
                                    .topVisitedlist[index].image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: const LinearGradient(
                                colors: GradiantColors.blogpost,
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
                                Text(
                                    homescreencontroller
                                        .topVisitedlist[index].author!,
                                    style: texttheme.titleMedium),
                                Row(
                                  children: [
                                    Text(
                                      homescreencontroller
                                          .topVisitedlist[index].view!,
                                      style: texttheme.titleMedium,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye,
                                      color: SoildColors.scafoldbg,
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
                      homescreencontroller.topVisitedlist[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topPodcast({required Size size, required double bodymargin}) {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homescreencontroller.topPodcasts.length,
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
                      child: CachedNetworkImage(
                        imageUrl:
                            homescreencontroller.topPodcasts[index].poster!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (context, url) => loading(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: size.width / 3,
                    child: Text(
                      homescreencontroller.topPodcasts[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget poster({required Size size, required TextTheme texttheme}) {
    return Stack(
      children: [
        Container(
          height: size.height / 4.2,
          width: size.width / 1.19,
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            gradient: LinearGradient(
                colors: GradiantColors.homePosterCover,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: CachedNetworkImage(
            imageUrl: homescreencontroller.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => const loading(),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              size: 50,
            ),
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
                        color: SoildColors.scafoldbg,
                        size: 17,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                homescreencontroller.poster.value.title!,
                style: texttheme.displayLarge,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SeeMorePadcast extends StatelessWidget {
  const SeeMorePadcast({
    super.key,
    required this.index,
    required this.bodymargin,
  });

  // ignore: prefer_typing_uninitialized_variables
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
            color: SoildColors.seemore,
          ),
          const SizedBox(width: 8),
          const Text(
            MyString.viewHotestpadcast,
            style: TextStyle(
              color: SoildColors.seemore,
            ),
          ),
        ],
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

  // ignore: prefer_typing_uninitialized_variables
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
            color: SoildColors.seemore,
          ),
          const SizedBox(width: 8),
          const Text(
            MyString.viewHotestBlog,
            style: TextStyle(
              color: SoildColors.seemore,
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
            child: maintags(
              texttheme: texttheme,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
