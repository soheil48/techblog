import 'package:flutter_tech_blog/component/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    this.id,
    this.title,
    this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = Apiconstant.hostDlurl + element["image"];
  }
}
