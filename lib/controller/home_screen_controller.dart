import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/component/api_constant.dart';
import 'package:flutter_tech_blog/models/poster_model.dart';
import 'package:flutter_tech_blog/services/dio_services.dart';
import 'package:get/get.dart';

class Homescreencontroller extends GetxController {
  late Rx<PosterModel> poster;
  RxList tagslist = RxList();
  RxList topVisitedlist = RxList();
  RxList topPodcasts = RxList();

  getHomeItemes() async {
    var response = await Dioservice().getmethod(Apiconstant.gethomeitem);

    response.data['poster'];
    response.data['top_visited'];
    response.data['top_podcasts'];
    response.data['tags'];

    print(response.data['poster']['title']);
  }
}
