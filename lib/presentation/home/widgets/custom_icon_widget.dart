import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final icon;
  final String title;
  final double iconSize;
  final double fontSize;

  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.iconSize = 25,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
