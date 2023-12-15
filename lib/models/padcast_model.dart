import 'package:flutter_tech_blog/component/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodcastModel(
      {required this.id,
      required this.title,
      required this.poster,
      required this.catId,
      required this.catName,
      required this.author,
      required this.view,
      required this.createdAt});

  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = Apiconstant.hostDlurl + element["poster"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}
