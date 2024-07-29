import 'package:flutter/material.dart';

import '../../../constants/sizeconfig.dart';
import '../../../core/theme/palette.dart';

TextStyle bigBoldTitle() {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(15),
    fontWeight: FontWeight.w800,
    color: Palette.white,
    letterSpacing: SizeConfig.getPercentSize(3),
    shadows: <Shadow>[
      Shadow(
        // offset: Offset(1.0, 1.0),
        blurRadius: SizeConfig.getPercentSize(2),
        color: Palette.white,
      ),
    ],
  );
}

TextStyle titleLarge({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(6),
    fontWeight: FontWeight.w700,
    color: color ?? Palette.black,
  );
}

TextStyle bigTitle({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(5),
    fontWeight: FontWeight.w700,
    color: color ?? Palette.black,
  );
}

TextStyle title({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(5.5),
    fontWeight: FontWeight.w600,
    color: color ?? Palette.black,
  );
}

TextStyle title1({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(4.5),
    fontWeight: FontWeight.bold,
    color: color ?? Palette.black,
  );
}

TextStyle titleNoBody({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(4),
    color: color ?? Palette.black,
  );
}

TextStyle smallTitle({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(5),
    fontWeight: FontWeight.w500,
    color: color ?? Palette.black,
  );
}

TextStyle descp() {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(4.25),
    fontWeight: FontWeight.w600,
    color: Palette.black,
  );
}

TextStyle smallDescp({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(4),
    fontWeight: FontWeight.w900,
    color: color ?? Palette.black,
  );
}

TextStyle smallDescp2({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(3.2),
    fontWeight: FontWeight.w500,
    color: color ?? Palette.black,
  );
}

TextStyle smallTitle2({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(3),
    fontWeight: FontWeight.w500,
    color: color ?? Palette.black,
  );
}

TextStyle smallDescp3({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(3.3),
    fontWeight: FontWeight.w600,
    color: color ?? Palette.black,
  );
}

TextStyle smallDescp4({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(2.7),
    fontWeight: FontWeight.w600,
    color: color ?? Palette.black,
  );
}

TextStyle smallDescpItalic4({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(3),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
    color: color ?? Palette.black,
  );
}

TextStyle smallDescp5({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(2.8),
    color: color ?? Palette.black,
  );
}

TextStyle smallDescp6({Color? color}) {
  return TextStyle(
      fontSize: SizeConfig.getPercentSize(2.9),
      color: color ?? Palette.black,
      fontWeight: FontWeight.bold);
}

// TextStyle textField({Color? color}) {
//   return TextStyle(
//     fontSize: SizeConfig.getPercentSize(4.6),
//     fontWeight: FontWeight.w400,
//     color: color ?? ColorConstants.black,
//   );
// }

TextStyle hintField() {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(4.5),
    fontWeight: FontWeight.w500,
    color: Palette.grey,
  );
}

TextStyle largeButton({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(5.3),
    fontWeight: FontWeight.w600,
    color: color ?? Palette.black,
  );
}

TextStyle smallButton({Color? color}) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(4.5),
    fontWeight: FontWeight.w500,
    color: color ?? Palette.black,
  );
}
