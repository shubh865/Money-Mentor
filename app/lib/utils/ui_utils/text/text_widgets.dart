import 'package:flutter/material.dart';

import 'text_style.dart' as typography;

class Txt extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  // final Color color;

  const Txt(
    this.text, {
    super.key,
    required this.style,
    this.textAlign = TextAlign.start,
    // this.co

  });

  // Static methods for each style
  static Widget bigBoldTitle(
    String text, {
    Key? key,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Txt(
        text,
        style: typography.bigBoldTitle(),
        textAlign: textAlign,
      );

  static Widget bigTitle(
    String text, {
    Key? key,
    TextAlign textAlign = TextAlign.start,
    var color,
  }) =>
      Txt(
        text,
        style: typography.bigTitle(color: color),
        textAlign: textAlign,
      );

  static Widget title(
    String text, {
    Key? key,
    TextAlign textAlign = TextAlign.start,
    var color,
  }) =>
      Txt(
        text,
        style: typography.title(color: color),
        textAlign: textAlign,
      );

  static Widget smallTitle(
    String text, {
    Key? key,
    TextAlign textAlign = TextAlign.start,
    var color,
  }) =>
      Txt(
        text,
        style: typography.smallTitle(color: color),
        textAlign: textAlign,
      );

  // static Widget textField(
  //   String text, {
  //   Key? key,
  //   TextAlign textAlign = TextAlign.start,
  //   var color,
  // }) =>
  //     Txt(
  //       text,
  //       style: typography.textField(color: color),
  //       textAlign: textAlign,
  //     );

  static Widget hintField(String text,
          {Key? key, TextAlign textAlign = TextAlign.start}) =>
      Txt(
        text,
        style: typography.hintField(),
        textAlign: textAlign,
      );

  static Widget largeButton(
    String text, {
    Key? key,
    TextAlign textAlign = TextAlign.start,
    var color,
  }) =>
      Txt(
        text,
        style: typography.largeButton(color: color),
        textAlign: textAlign,
      );

  static Widget smallButton(
    String text, {
    Key? key,
    TextAlign textAlign = TextAlign.start,
    var color,
  }) =>
      Txt(
        text,
        style: typography.smallButton(color: color),
        textAlign: textAlign,
      );

  static Widget descp(String text,
          {Key? key, TextAlign textAlign = TextAlign.start}) =>
      Txt(
        text,
        style: typography.descp(),
        textAlign: textAlign,
      );

  static Widget smallDescp2(String text,
          {Key? key, TextAlign textAlign = TextAlign.start}) =>
      Txt(
        text,
        style: typography.smallDescp2(),
        textAlign: textAlign,
      );

  static Widget smallDescp(
    String text, {
    Key? key,
    TextAlign textAlign = TextAlign.start,
    var color,
  }) =>
      Txt(
        text,
        style: typography.smallDescp(color: color),
        textAlign: textAlign,
      );

  static Widget smallDescp3(
    String text, {
    Key? key,
    TextAlign textAlign = TextAlign.start,
    var color,
  }) =>
      Txt(
        text,
        style: typography.smallDescp3(color: color),
        textAlign: textAlign,
      );

  static Widget smallTitle2(
    String text, {
    Key? key,
    TextAlign textAlign = TextAlign.start,
    var color,
  }) =>
      Txt(
        text,
        style: typography.smallTitle2(color: color),
        textAlign: textAlign,
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
    );
  }
}
