import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

class TextStyles {
  static final font16BlackRegular = GoogleFonts.albertSans(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  static final font12GreySemiBold = GoogleFonts.albertSans(
    fontSize: 12,
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  );
  static final font16SecondaryColorSemiBold = GoogleFonts.albertSans(
    fontSize: 16,
    color: ColorManager.secondaryColor,
    fontWeight: FontWeight.w600,
  );
  static final font24BrownBold = GoogleFonts.albertSans(
    fontSize: 24,
    color: ColorManager.brownColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );
  static final font22DarkRedBold = GoogleFonts.albertSans(
    fontSize: 22,
    color: ColorManager.backgroundColor,
    fontWeight: FontWeight.bold,
  );
  static final font16BlackBold = GoogleFonts.albertSans(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static final font12RedMedium = GoogleFonts.albertSans(
    fontSize: 12,
    color: ColorManager.darkRedColor,
    fontWeight: FontWeight.w500,
  );
  static final font16RedMedium = GoogleFonts.albertSans(
    fontSize: 16,
    color: Colors.red,
    fontWeight: FontWeight.w500,
  );
  static final font16WhiteBold = GoogleFonts.albertSans(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static final font18BrownSemiBold = GoogleFonts.albertSans(
    fontSize: 18,
    color: ColorManager.brownColor,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
  static final font20DarkRedBold = GoogleFonts.albertSans(
    fontSize: 20,
    color: ColorManager.darkRedColor,
    fontWeight: FontWeight.bold,
  );
  static final font14BrownNormal = GoogleFonts.albertSans(
    fontSize: 14,
    color: ColorManager.brownColor.withValues(alpha: 0.7),
    height: 1.4,
  );
  static final font14WhiteMedium = GoogleFonts.albertSans(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static final font18SecondaryColorMedium = GoogleFonts.albertSans(
    fontSize: 18,
    color: ColorManager.secondaryColor,
    fontWeight: FontWeight.w500,
  );
  static final font26WhiteBold = GoogleFonts.albertSans(
    fontSize: 26,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.5,
    shadows: [
      Shadow(color: Colors.black54, blurRadius: 8, offset: Offset(2, 2)),
    ],
  );
  static final font20WhiteBold = GoogleFonts.albertSans(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font16GreyMedium = GoogleFonts.albertSans(
    fontSize: 16,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font28BrownBold = GoogleFonts.albertSans(
    fontSize: 28,
    color: ColorManager.brownColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font16BrownNormal = GoogleFonts.albertSans(
    fontSize: 16,
    color: ColorManager.brownColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font14GreyMedium = GoogleFonts.albertSans(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font16BlackMedium = GoogleFonts.albertSans(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font14SecondaryColorMedium = GoogleFonts.albertSans(
    fontSize: 14,
    color: ColorManager.darkRedColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font14BlackMedium = GoogleFonts.albertSans(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}
