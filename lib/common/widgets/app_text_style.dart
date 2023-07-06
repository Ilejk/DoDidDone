import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTextStyle({
  required double fontSize,
  required Color color,
  required FontWeight fontWeight,
  double? letterSpacing = 0,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
  );
}
