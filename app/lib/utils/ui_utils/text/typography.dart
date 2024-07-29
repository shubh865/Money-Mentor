import 'package:flutter/material.dart';

import '../../../constants/sizeconfig.dart';

class Typo {
  Typo._();

  static TextStyle displayLarge = const TextStyle(
    fontSize: 96.0,
    fontWeight: FontWeight.w300,
    // letterSpacing: -1.5,
  );

  static TextStyle displayMedium = const TextStyle(
    fontSize: 60.0,
    fontWeight: FontWeight.w300,
    // letterSpacing: -0.5,
  );

  static TextStyle displaySmall = const TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.0,
  );

  static TextStyle headlineLarge = const TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.25,
  );

  static TextStyle headlineMedium = TextStyle(
    fontSize: SizeConfig.getPercentSize(4.2),
    fontWeight: FontWeight.w600,
    // letterSpacing: 0.25,
  );

  static TextStyle headlineSmall = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.0,
  );

  static TextStyle titleLarge = TextStyle(
    // static TextStyle titleLarge = GoogleFonts.montserrat(
    fontSize: SizeConfig.getPercentSize(6),
    fontWeight: FontWeight.w700,
    // letterSpacing: 0.15,
  );

  static TextStyle titleMedium = TextStyle(
    fontSize: SizeConfig.getPercentSize(5),
    fontWeight: FontWeight.w500,
    // letterSpacing: 0.15,
  );

  static TextStyle titleSmall = TextStyle(
    fontSize: SizeConfig.getPercentSize(4.5),
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.1,
  );

  static TextStyle bodyLarge = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.5,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: SizeConfig.getPercentSize(4),
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.25,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: SizeConfig.getPercentSize(3.5),
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.4,
  );

  static TextStyle labelLarge = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    // letterSpacing: 1.25,
  );

  static TextStyle labelSmall = const TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    // letterSpacing: 1.5,
  );
  static TextStyle labelmedium = const TextStyle(
      fontSize: 10.0, fontWeight: FontWeight.w500, color: Colors.white
      // letterSpacing: 1.5,
      );

  static TextStyle textMedium = TextStyle(
    fontSize: SizeConfig.getPercentSize(3.5),
    fontWeight: FontWeight.w600,
    // letterSpacing: 0.25,
  );

  static TextStyle analyticsStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    // letterSpacing: 0.15,
  );
}
