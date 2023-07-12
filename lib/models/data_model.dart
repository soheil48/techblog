class HashTags {
  String title;
  HashTags({required this.title});
}

class Blogmodel {
  int id;
  String imageurl;
  String title;
  String writer;
  String writerimageurl;
  String date;
  String content;
  String view;

  Blogmodel({
    required this.id,
    required this.imageurl,
    required this.title,
    required this.writer,
    required this.writerimageurl,
    required this.date,
    required this.content,
    required this.view,
  });
}

class Padcastmodel {
  int id;
  String imageurl;
  String title;
  String writer;
  late String writerimageurl;
  String date;
  String content;

  Padcastmodel({
    required this.id,
    required this.imageurl,
    required this.title,
    required this.writer,
    required this.writerimageurl,
    required this.date,
    required this.content,
  });
}
