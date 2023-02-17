import 'package:charmin/constants/constants.dart';
import 'package:charmin/router/widget/slide_shape.dart';
import 'package:charmin/store/store_color.dart';
import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData.light().copyWith(
      backgroundColor: const Color(0xFFFAFAFA),
      dialogBackgroundColor: ColorStore.dialogBackgroundColor,
      primaryColor: const Color(0xFFF56E22),
      hintColor: Colors.grey[400],
      disabledColor: Colors.grey[700],
      secondaryHeaderColor: Colors.deepOrangeAccent[400],
      errorColor: Colors.redAccent[700],
      splashColor: Colors.transparent,
      highlightColor: const Color(0xFF2374ED),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: ColorStore.primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: ColorStore.primaryColor,
          padding: const EdgeInsets.symmetric(
              vertical: sapceGap, horizontal: sapceGap * 4),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: ColorStore.primaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: ColorStore.primaryColor,
          ),
          borderRadius: BorderRadius.circular(sapceGap * 3),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(sapceGap * 3),
        ),
      ),
      sliderTheme: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorColor: Color(0xFFF56E22),
        thumbColor: ColorStore.primaryColor,
        activeTrackColor: ColorStore.primaryColor,
        trackShape: SliderCustomTrackShape(),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline2: TextStyle(
            fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline3: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline4: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black),
        headline5: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
        headline6: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
        subtitle1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black),
        subtitle2: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
        bodyText1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black),
        bodyText2: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),
        caption: TextStyle(fontSize: 14.0, color: Color(0xFFAFAFAF)),
        button: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        overline: TextStyle(fontSize: 14.0),
      ).apply(
          // bodyColor: Colors.black,
          ));
}
