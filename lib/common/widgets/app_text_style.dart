import 'package:todo_app/common/export/export.dart';

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
