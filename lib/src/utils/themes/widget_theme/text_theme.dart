import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class STextTheme{
  static TextTheme lightTextTheme = TextTheme(
    headlineMedium: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
    titleMedium: GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 24,
    ),

  );
  static TextTheme darkTextTheme = TextTheme(
    headlineMedium: GoogleFonts.montserrat(
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 24,
    ),
  );
}