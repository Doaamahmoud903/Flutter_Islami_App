import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

class AppTheme{
   static final ThemeData darkTheme = ThemeData(
       fontFamily: "JannaLT",
       textTheme: TextTheme(
         bodyLarge:AppStyles.fontBold24,
         bodyMedium: AppStyles.fontBold16,
         bodySmall: AppStyles.fontBold14,
       ),
       scaffoldBackgroundColor: AppColor.transparentColor,
       bottomNavigationBarTheme: BottomNavigationBarThemeData(
         selectedItemColor: AppColor.whiteColor,
         unselectedItemColor: AppColor.blackColor,
       ),
     appBarTheme: AppBarTheme(
       backgroundColor: Colors.black,
       centerTitle: true,
       iconTheme: IconThemeData(
         color: AppColor.primaryColor,
       )
     )
   );
}