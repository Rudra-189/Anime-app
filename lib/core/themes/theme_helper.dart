import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppThemeHelper{

  static const Color primaryColor = Colors.orange;
  static const Color secondaryColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;

  static ThemeData get darkTheme{
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: Colors.orange,
        secondary: Colors.black,
        onPrimary: Colors.white
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: secondaryColor,
      ),
      inputDecorationTheme:InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      textTheme: GoogleFonts.montserratTextTheme(
        TextTheme(
          displayLarge: TextStyle(
                  color: blackColor,
                  fontSize: 16.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600
              ),
          displayMedium: TextStyle(
                color: primaryColor,
                fontSize: 14.sp,
              ),
          displaySmall: TextStyle (
                color: primaryColor,
                fontSize: 10.sp,
              ),
          titleLarge: TextStyle(
                  color: whiteColor,
                  fontSize: 16.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500
              ),
          titleMedium: TextStyle(
                color: whiteColor.withOpacity(0.75),
                fontSize: 14.sp,
              ),
          titleSmall: TextStyle(
                color: whiteColor.withOpacity(0.5),
                fontSize: 12.sp,
              ),
          bodyLarge: TextStyle(
                  color: whiteColor,
                  fontSize: 15.sp,
                  overflow: TextOverflow.ellipsis
              ),
          bodyMedium: TextStyle(
                color: whiteColor,
                fontSize: 13.sp,
              ),
          bodySmall: TextStyle(
                color: whiteColor.withOpacity(0.75),
                fontSize: 11.sp,
              ),
          labelLarge: TextStyle(
            color: whiteColor
          ),
          ),
      ),
    );
  }
}

class CustomColors {
  final Color primaryColor;
  final Color secondaryColor;

  const CustomColors({required this.primaryColor, required this.secondaryColor});

  static const light = CustomColors(
    primaryColor: Colors.orange,
    secondaryColor: Colors.white,
  );

  static const dark = CustomColors(
    primaryColor: Colors.orange,
    secondaryColor: Colors.black,
  );

}

extension ThemeDataCustomColors on ThemeData {
  CustomColors get customColors => brightness == Brightness.dark ? CustomColors.dark : CustomColors.light;
}
