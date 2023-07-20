import 'package:todo_app/common/export/export.dart';

class AppColors {
  AppColors._();

  static const Color black = Colors.black;
  static const Color black87 = Colors.black87;
  static const Color black54 = Colors.black54;
  static const Color black26 = Colors.black26;
  static const Color white = Colors.white;
  static const Color white54 = Colors.white54;
  static const Color error = Colors.red;
  static const Color green = Color.fromARGB(255, 57, 198, 61);
  static Color primaryDarkGrey = HexColor.fromHex('#202020');
  static Color secondaryDarkGrey = HexColor.fromHex('#2D2D2D');
  static Color accentDarkGrey = HexColor.fromHex('#444444');
  static Color lightOrange = HexColor.fromHex('#FE776A');
  static Color lightPurple = HexColor.fromHex('#7D97F4');
  static Color darkPurple = HexColor.fromHex('#110E72');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
