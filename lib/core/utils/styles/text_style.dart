import 'package:bidding_house/core/utils/imports.dart';

enum CustomColor {
  white,
  grey,
  blue,
  yellow,
}

Color getColor(CustomColor customColor) {
  switch (customColor) {
    case CustomColor.white:
      return Colors.white;
    case CustomColor.grey:
      return const Color(0xFF969696);
    case CustomColor.blue:
      return const Color(0xFF5494F5);
    case CustomColor.yellow:
      return const Color(0xFFCAA138);

    default:
      return Colors.black;
  }
}

class AppTextStyles {
/*
===>inter32white
   comfortaa => font family comfortaa
   32 => font size
   700 => font weight
*/

  static TextStyle style46_800(BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 46.w(context),
      fontWeight: FontWeight.w800,
    );
  }
  static TextStyle style8_400(BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 8.w(context),
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle style10_700(BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 10.w(context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style14_400(BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 14.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style16_400(BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 16.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style16_800(BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 16.w(context),
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle style20_800(BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 20.w(context),
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle style14_800(BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 14.w(context),
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle style10_800(BuildContext context) {
    return GoogleFonts.museoModerno(
      color: const Color(0xff73807F),
      fontSize: 10.w(context),
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle style10_800Price(
      BuildContext context) {
    return GoogleFonts.museoModerno(
      color: const Color(0xffCAA138),
      fontSize: 10.w(context),
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle style12_800(BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 12.w(context),
      fontWeight: FontWeight.w800,
    );
  }
  static TextStyle style7_700(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 7.w(context),
      fontWeight: FontWeight.w700,
    );
  }  static TextStyle style24_700(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.museoModerno(
      color: getColor(customColor),
      fontSize: 24.w(context),
      fontWeight: FontWeight.w700,
    );
  }
}
