import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Main Colors
  static const Color primary = Color(0xFF6A0DAD); // Ezibiz Purple
  static const Color accent = Color(0xFFFF7F00); // Orange from logo
  static const Color background = Color(0xFFF9F9F9);
  static const Color card = Colors.white;

  // Text & Icon Colors
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF666666);
  static const Color iconGrey = Color(0xFF9E9E9E);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color danger = Color(0xFFF44336);

  // Primary Color Palette (from Figma)
  static const Color primary100 = Color(0xFFD6AEF5);
  static const Color primary200 = Color(0xFFAE5DEB);
  static const Color primary300 = Color(0xFF831AD3);
  static const Color primary400 = Color(0xFF661AA4);
  static const Color primary500 = Color(0xFF490E75);
  static const Color primaryAlpha10 = Color(0x1A831AD3); // 10% opacity of #831AD3
}


final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    secondary: AppColors.accent,
    background: AppColors.background,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
  // Headings
  displayLarge: GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  ),
  displayMedium: GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  ),
  displaySmall: GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  ),

  // Body Large
  titleLarge: GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  ),
  titleMedium: GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  ),
  titleSmall: GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  ),

  // Body Normal
  bodyLarge: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  ),
  bodyMedium: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  ),
  bodySmall: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
  ),

  // Body Small
  labelLarge: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  ),
  labelMedium: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  ),

  // Captions
  labelSmall: GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  ),
  headlineSmall: GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  ),
),


  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColors.textPrimary),
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
  ),
  cardTheme: CardTheme(
    color: AppColors.card,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.iconGrey,
    selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
    unselectedLabelStyle: GoogleFonts.poppins(),
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: GoogleFonts.poppins(color: AppColors.textSecondary),
  ),
);
