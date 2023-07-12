// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/my_colors.dart';

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
