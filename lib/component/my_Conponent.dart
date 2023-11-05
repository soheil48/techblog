// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/component/my_colors.dart';
import 'package:flutter_tech_blog/gen/assets.gen.dart';
import 'package:flutter_tech_blog/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SoildColors.dvider,
      indent: size.width / 6,
      endIndent: size.width / 6,
      thickness: 1.5,
    );
  }
}

// ignore: must_be_immutable
class maintags extends StatelessWidget {
  maintags({super.key, required this.texttheme, required this.index});

  final TextTheme texttheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
        gradient: LinearGradient(
          colors: GradiantColors.tag,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
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
    );
  }
}

mylaunchurl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log('could not launch ${uri.toString()}' as num);
  }
}
