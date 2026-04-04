import 'package:flutter/material.dart';

class FontWeightHelper {
  static FontWeight getFontWeight(String fontWeight) {
    switch (fontWeight.toLowerCase()) {
      case 'thin':
        return FontWeight.w100;
      case 'extralight':
        return FontWeight.w200;
      case 'light':
        return FontWeight.w300;
      case 'regular':
        return FontWeight.w400;
      case 'medium':
        return FontWeight.w500;
      case 'semibold':
        return FontWeight.w600;
      case 'bold':
        return FontWeight.w700;
      case 'extrabold':
        return FontWeight.w800;
      case 'black':
        return FontWeight.w900;
      default:
        return FontWeight.normal; // Default to normal if not recognized
    }
  }
}
