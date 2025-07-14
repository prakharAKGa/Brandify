import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: AppColors.backgroundEnd,
        // Remove fontFamily since we're using GoogleFonts.montserrat directly
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.montserrat(
            color: AppColors.textWhite,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: GoogleFonts.montserrat(
            color: AppColors.textLightGrey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          labelMedium: GoogleFonts.montserrat(
            color: AppColors.skipText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.textWhite,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            shape: const CircleBorder(),
            textStyle: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
}