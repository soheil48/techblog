import 'package:flutter/material.dart';
import 'package:flutter_tech_blog/my_colors.dart';

class myDivider extends StatelessWidget {
  const myDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: soildcolors.dvider,
      indent: size.width / 6,
      thickness: 1.5,
    );
  }
}
