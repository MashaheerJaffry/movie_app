import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/theme&utilities/pallets.dart';

var lightTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Pallete.primary,
  scaffoldBackgroundColor: Colors.white,

  splashColor: Pallete.primary.withOpacity(0.1),

  useMaterial3: true,
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 96.sp),
    displayMedium: TextStyle(fontSize: 72.sp),
    displaySmall: TextStyle(fontSize: 60.sp),
    headlineLarge: TextStyle(fontSize: 48.sp),
    headlineMedium: TextStyle(fontSize: 40.sp),
    headlineSmall: TextStyle(fontSize: 34.sp),
    titleLarge: TextStyle(fontSize: 38.sp),
    titleMedium: TextStyle(fontSize: 24.sp),
    titleSmall: TextStyle(fontSize: 20.sp),
    bodyLarge: TextStyle(fontSize: 18.sp),
    bodyMedium: TextStyle(fontSize: 16.sp),
    bodySmall: TextStyle(fontSize: 13.sp),
    labelSmall: TextStyle(fontSize: 10.sp),
  ).apply(
    fontFamily: 'Inter',
    bodyColor: Pallete.greyDark,
    displayColor: Pallete.greyDark,
    fontSizeFactor: 1.sp,
  ),

  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Pallete.primary,
    onPrimary: Colors.white,
    primaryContainer: Pallete.primary,
    onPrimaryContainer: Colors.white,
    secondary: Pallete.primary,
    onSecondary: Colors.white,
    secondaryContainer: Pallete.primary,
    onSecondaryContainer: Colors.white,
    tertiary: Pallete.primary,
    onTertiary: Colors.white,
    tertiaryContainer: Pallete.primary,
    onTertiaryContainer: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    errorContainer: Colors.red,
    onErrorContainer: Colors.white,
    brightness: Brightness.dark,
    background: Colors.red,
    outline: Pallete.primary,
    surface: Pallete.greyDark,
    onSurface: Colors.white,
  ),

  // BUTTON

  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    buttonColor: Pallete.primary,
    splashColor: Pallete.primary.withOpacity(0.1),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      // primary: onPrimaryColor,
      // secondary: Colors.white,
      brightness: Brightness.dark,
      background: Colors.white,
      //background color for widgets like Card, bottomNavigationBar,btns etc
      surface: Colors.white,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
    ),
    height: 60.h,
    padding: EdgeInsets.symmetric(
      vertical: 14.h,
      horizontal: 20.w,
    ),
  ),

  cardTheme: CardTheme(
    elevation: 0.6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  // alert dialog
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    actionsPadding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 28.h),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22.r),
    ),
  ),

  iconTheme: const IconThemeData(
    color: Pallete.greyDark,
  ),

  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
  ),
);
