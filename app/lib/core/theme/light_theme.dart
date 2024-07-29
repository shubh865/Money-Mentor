import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ui_utils/text/typography.dart';
import 'palette.dart';

ThemeData lightTheme() => ThemeData(
      primaryColor: Palette.primaryPurple,
      primarySwatch: Palette.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Palette.white,
      colorScheme: const ColorScheme.light().copyWith(
        primary: Palette.primaryPurple,
        secondary: Palette.primaryBlue,
      ),
      appBarTheme: const AppBarTheme(
        color: Palette.white,
        surfaceTintColor: Palette.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Palette.black),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        // titleTextStyle: Typo.titleLarge,
      ),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      textTheme: TextTheme(
        displayLarge: Typo.displayLarge,
        displayMedium: Typo.displayMedium,
        displaySmall: Typo.displaySmall,
        headlineLarge: Typo.headlineLarge,
        headlineMedium: Typo.headlineMedium,
        headlineSmall: Typo.headlineSmall,
        titleLarge: Typo.titleLarge,
        titleMedium: Typo.titleMedium,
        titleSmall: Typo.titleSmall,
        bodyLarge: Typo.bodyLarge,
        bodyMedium: Typo.bodyMedium,
        bodySmall: Typo.bodySmall,
        labelLarge: Typo.labelLarge,
        labelSmall: Typo.labelSmall,
      ),
    );
