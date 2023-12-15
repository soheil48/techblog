import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/component/api_constant.dart';
import 'package:flutter_tech_blog/models/article_model.dart';
import 'package:flutter_tech_blog/models/padcast_model.dart';
import 'package:flutter_tech_blog/models/poster_model.dart';
import 'package:flutter_tech_blog/models/tag_model.dart';
import 'package:flutter_tech_blog/services/dio_services.dart';
import 'package:get/get.dart';

class Homescreencontroller extends GetxController {
  late Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagModel> tagslist = RxList();
  RxList<ArticleModel> topVisitedlist = RxList();
  RxList<PodcastModel> topPodcasts = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItemes();
  }

  getHomeItemes() async {
    loading.value = true;

    var response = await Dioservice().getmethod(Apiconstant.gethomeitem);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedlist.add(ArticleModel.fromJeson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcasts.add(PodcastModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);
    }
    loading.value = false;
  }
}
