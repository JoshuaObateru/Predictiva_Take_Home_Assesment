import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double? fontsize;
  final Color? color;
  const CustomTextWidget({super.key, required this.text, this.textStyle, this.fontsize, this.color});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Text(
      text,
      style: textStyle ??
          TextStyle(
              color: color ?? Theme.of(context).colorScheme.secondary,
              fontSize: fontsize ?? (width < 600 ? width * 0.03 : width * 0.015)),
      textAlign: TextAlign.start,
    );
  }
}
