import 'dart:ui';

const Color brandColor = Color(0xFF006600);

int getColorFromHex(String hexColor) {
  String colorString = '0xFF' + hexColor;

  int colorInt = int.parse(colorString);

  return colorInt;
}
