import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFFCEAE6),
  100: Color(0xFFF8CCC1),
  200: Color(0xFFF4AA98),
  300: Color(0xFFF0876E),
  400: Color(0xFFEC6E4F),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFFE64D2B),
  700: Color(0xFFE34324),
  800: Color(0xFFDF3A1E),
  900: Color(0xFFD92913),
});
const int _primaryPrimaryValue = 0xFFE95430;

const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFFFFABA2),
  700: Color(0xFFFF9389),
});
const int _primaryAccentValue = 0xFFFFD9D5;