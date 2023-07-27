import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimaryColor = Color.fromARGB(255, 50, 117, 67);
  static const Color kSecondaryColor = Color(0xFF979797);
  static const Color kSilver = Color.fromARGB(224, 224, 224, 224);
  static const Color kSilver1 = Color(0xFFF6F6F6);
  static const Color textColor = Color(0xFFccc7c5);
  static const Color mainColor = Color(0xFF89dad0);
  //static const Color mainColor = const Color(0xFFfa7552);
  static const Color iconColor1 = Color(0xFFffd28d);
  static const Color iconColor2 = Color(0xFFfcab88);
  static const Color paraColor = Color(0xFF8f837f);
  static const Color buttonBackgroundColor = Color(0xFFf7f6f4);
  static const Color signColor = Color(0xFFa9a29f);
  static const Color titleColor = Color(0xFF5c524f);
  static const Color mainBlackColor = Color(0xFF332d2b);
  //static const Color yellowColor = const Color(0xFFfa7552);
  static const Color yellowColor = Color(0xFFffd379);

  static const Color darkGray = Color.fromARGB(255, 79, 75, 74);
  //static const Color appmaincolor = Color.fromARGB(255, 255, 179, 102);
  static const kPrimaryLightColor = Color(0xFFFFECDF);

  // static const Color appmaincolor = Color.fromRGBO(213, 154, 98, 1);
  static const Color appmaincolor = Color.fromRGBO(30, 57, 112, 0.8);

  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(30, 57, 112, 0.8),
      Color.fromRGBO(30, 57, 112, 0.8),

      // Color.fromRGBO(67, 33, 32, 1),
      // Color.fromRGBO(213, 154, 98, 1)
      // Color.fromARGB(255, 217, 169, 74),
      // Color.fromARGB(255, 185, 56, 217)
    ],
  );

  static const kPrimaryGradientColor1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 238, 237, 235),
      Color.fromARGB(255, 91, 90, 89)
    ],
  );

  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const red = Color(0xFFDB3022);
}
