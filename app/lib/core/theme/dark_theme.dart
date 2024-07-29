import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ui_utils/text/typography.dart';
import 'palette.dart';

ThemeData darkTheme() => ThemeData(
      primaryColor: Palette.primaryPurple,
      primarySwatch: Palette.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Palette.black,
      // scaffoldBackgroundColor: ColorConstants.darkPurple,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: Palette.primaryPurple,
        secondary: Palette.primaryBlue,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Palette.black,
        surfaceTintColor: Palette.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(color: Palette.white),
        // titleTextStyle: Typo.titleLarge,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Palette.black,
        selectedItemColor: Palette.primaryPurple,
        unselectedItemColor: Palette.white,
        selectedIconTheme: IconThemeData(color: Palette.primaryPurple),
        elevation: 0,
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
