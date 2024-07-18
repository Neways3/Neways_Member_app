import 'package:flutter/material.dart';

class CustomMultilineText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextAlign? alignment;
  final int? maxLine;
  const CustomMultilineText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.fontStyle,
      this.alignment,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.justify,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
      style: TextStyle(
          color: color ?? Theme.of(context).textTheme.headline1?.color,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.headline1?.fontWeight,
          fontSize: fontSize ?? Theme.of(context).textTheme.headline1?.fontSize,
          fontStyle:
              fontStyle ?? Theme.of(context).textTheme.headline1?.fontStyle),
    );
  }
}

class CustomSimpleText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextAlign? alignment;
  final TextDecoration? textDecoration;

  const CustomSimpleText({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.alignment,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.center,
      style: TextStyle(
        color: color ?? Theme.of(context).textTheme.headline1?.color,
        fontWeight:
            fontWeight ?? Theme.of(context).textTheme.headline1?.fontWeight,
        fontSize: fontSize ?? Theme.of(context).textTheme.headline1?.fontSize,
        fontStyle:
            fontStyle ?? Theme.of(context).textTheme.headline1?.fontStyle,
        decoration: textDecoration,
      ),
    );
  }
}

class FieldTitleText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextAlign? alignment;
  const FieldTitleText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.fontStyle,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.start,
      style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight:
              fontWeight ?? FontWeight.w800,
          fontSize: fontSize ?? 15,),
    );
  }
  // fontSize: 15, color: Colors.grey.shade700,fontWeight: FontWeight.w800
}
