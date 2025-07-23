
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

class TextStyles {
  static final font16BlackRegular = GoogleFonts.albertSans(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w400,
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


  static const font14BlackRegular = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );


  static const font18BlackRegular = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static const font20BlackRegular = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static const font24BlackRegular = TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

}