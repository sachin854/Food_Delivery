import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final Color? titleColor;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextDecoration? textDecoration;
  final TextOverflow? textoverflow;


  const TextWidget({super.key,
    required this.title,
    this.padding,
    this.titleColor,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.textAlign,
    this.maxLine,
    this.textDecoration,
    this.textoverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLine,
      style: TextStyle(
        height: height,
        color: titleColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
          decoration: textDecoration,
        overflow: textoverflow
      ),
    );
  }
}