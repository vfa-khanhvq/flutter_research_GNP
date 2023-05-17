import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/theme/colors.dart';

class AppTheme {
  static ThemeData light = ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: CustomColor.green,
  );
  static ThemeData dark = ThemeData.dark().copyWith(
    useMaterial3: true,
  );
}
