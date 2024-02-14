import 'package:flutter/material.dart';
import 'package:kaizen_be_better/layout/kaizen_colors.dart';

class KaizenTheme {
  static ThemeData theme(){
    final primaryColor = HexColor(KaizenColors.primaryColor);
    final secondColor = HexColor(KaizenColors.secondColor);

    final ThemeData defaultThemeData = ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: HexColor(KaizenColors.generalWhite)),
        color: secondColor,
      ),
      fontFamily: 'Montserrat',
      scaffoldBackgroundColor: primaryColor,
      primaryColor: primaryColor,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w500,
          color: HexColor(KaizenColors.generalBlack),
        )
      ),
        inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
        borderSide: BorderSide(
        color: primaryColor,
    ),
          borderRadius: BorderRadius.circular(15),
    ),
    )
    );

    return defaultThemeData.copyWith(
      colorScheme: defaultThemeData.colorScheme.copyWith(
        primary: primaryColor,
        secondary: secondColor,
      )
    );
  }
}