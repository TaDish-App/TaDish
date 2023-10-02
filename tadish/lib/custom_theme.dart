import 'package:flutter/material.dart';

const Color customPrimaryColor = Color(0xFF33241C);
const Color customDarkBrownColor = Color(0xFF805B4E);
const Color customLightBrownColor = Color(0xFF9F8177);

final MaterialColor customPrimarySwatch = MaterialColor(
  customPrimaryColor.value,
  const <int, Color>{
    50: customPrimaryColor,
    100: customPrimaryColor,
    200: customPrimaryColor,
    300: customPrimaryColor,
    400: customPrimaryColor,
    500: customPrimaryColor,
    600: customPrimaryColor,
    700: customPrimaryColor,
    800: customPrimaryColor,
    900: customPrimaryColor,
  },
);

final ThemeData customTheme = ThemeData(
  primarySwatch: customPrimarySwatch,
  secondaryHeaderColor: Colors.white,

  // Define your custom text theme with white text color
  // textTheme: const TextTheme(
  //   headlineMedium: TextStyle(color: Colors.white),
  //   headlineSmall: TextStyle(color: Colors.white),
  // ),
);
