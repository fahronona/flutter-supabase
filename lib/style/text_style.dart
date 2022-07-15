import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static var bigTitle = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 0.5,
  );

  static var title = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: 0.5,
  );

  static var normal = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.5,
  );

  static var small = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    letterSpacing: 0.3,
  );
}