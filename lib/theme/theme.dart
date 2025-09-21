import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary (Purple)
  static const Color primary = Color(0xFF7400FF); // Core brand purple
  static const Color primaryLight = Color(0xFF8F33FF);
  static const Color primaryDark = Color(0xFF3C0085);
  static const Color primary100 = Color(0xFFF1E8FA);
  static const Color primary200 = Color(0xFFB38AE5);
  static const Color primary300 = Color(0xFF5F00D1);

  // Secondary (Orange)
  static const Color secondary = Color(0xFFFF6D00); // Core accent orange
  static const Color secondaryLight = Color(0xFFFFA766);
  static const Color secondaryDark = Color(0xFFCC5700);
  static const Color secondary100 = Color(0xFFFFF3E9);
  static const Color secondary200 = Color(0xFFFFC599);
  static const Color secondary300 = Color(0xFFFF8A33);

  // Background & Surfaces
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
}

final ThemeData appTheme = ThemeData(
  cardColor: Colors.white,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSeed(
  seedColor: AppColors.primary,
  primary: AppColors.primary,
  secondary: AppColors.secondary,
  background: AppColors.background,
  brightness: Brightness.light,
),

  // Text Theme
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
    displayMedium: GoogleFonts.inter(
      fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
    displaySmall: GoogleFonts.inter(
      fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
    titleLarge: GoogleFonts.inter(
      fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.textPrimary),
    titleMedium: GoogleFonts.inter(
      fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
    titleSmall: GoogleFonts.inter(
      fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textSecondary),
    bodyMedium: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
    bodySmall: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textSecondary),
    labelLarge: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textSecondary),
    labelMedium: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
    labelSmall: GoogleFonts.inter(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textSecondary),
    headlineSmall: GoogleFonts.inter(
      fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary),
  ),

  // AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColors.textPrimary),
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
  ),

  // Card
  cardTheme: CardTheme(
  //cardColor: Colors.white,
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  elevation: 3,
  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
),


  // Bottom Navigation
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.iconGrey,
    selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
    unselectedLabelStyle: GoogleFonts.poppins(),
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
  ),

  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      side: const BorderSide(color: AppColors.primary),
      textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
  ),

  // Input fields
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.iconGrey, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.iconGrey, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    ),
    hintStyle: GoogleFonts.poppins(color: AppColors.textSecondary),
  ),

  // Feedback (Snackbars & Dialogs)
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.primary,
    contentTextStyle: GoogleFonts.inter(color: Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    behavior: SnackBarBehavior.floating,
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
    contentTextStyle: GoogleFonts.inter(color: AppColors.textSecondary),
  ),

  // Misc
  dividerTheme: const DividerThemeData(
    thickness: 1,
    color: AppColors.iconGrey,
  ),
  iconTheme: const IconThemeData(color: AppColors.iconGrey),
  listTileTheme: ListTileThemeData(
    textColor: AppColors.textPrimary,
    iconColor: AppColors.iconGrey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.primary300),
    radius: const Radius.circular(8),
    thickness: WidgetStateProperty.all(6),
  ),
);
