import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class AppStyles {
  // Base styles
  static const TextStyle _baseBoldWhite = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.whiteColor,
  );

  static const TextStyle _baseBoldBlack = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.blackColor,
  );

  static const TextStyle _baseBoldPrimary = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.primaryColor,
  );

  static const TextStyle _baseBoldBrown = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.brownColor,
  );
  static const TextStyle _baseBoldOffWhite = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.brownColor,
  );

  static const TextStyle _baseNormalWhite = TextStyle(
    color: AppColor.whiteColor,
  );

  // Keep all original names but eliminate duplicates
  static  TextStyle fontBold24 = _baseBoldWhite.copyWith(fontSize: 24);
  static  TextStyle fontBold24Brown = _baseBoldBrown.copyWith(fontSize: 24);
  static  TextStyle fontBold24Black = _baseBoldBlack.copyWith(fontSize: 24);
  static  TextStyle fontBold24Primary = _baseBoldPrimary.copyWith(fontSize: 24);
  static  TextStyle fontBold20 = _baseBoldPrimary.copyWith(fontSize: 20);
  static  TextStyle fontBold20offWhite = _baseBoldOffWhite.copyWith(fontSize: 20);
  static  TextStyle fontBold18White = _baseBoldWhite.copyWith(fontSize: 20);
  static  TextStyle fontBold20White = _baseBoldWhite.copyWith(fontSize: 20);
  static  TextStyle fontBold20black = _baseBoldBlack.copyWith(fontSize: 20);
  static  TextStyle fontBold22 = _baseBoldBlack.copyWith(fontSize: 22);
  static  TextStyle fontBold22Primary = _baseBoldPrimary.copyWith(fontSize: 22);

  static  TextStyle fontBold22White = _baseBoldWhite.copyWith(fontSize: 22);
  static  TextStyle fontBold16 = _baseNormalWhite.copyWith(fontSize: 16, fontWeight: FontWeight.bold);
  static  TextStyle fontBold36 = _baseNormalWhite.copyWith(fontSize: 36, fontWeight: FontWeight.bold);
  static  TextStyle fontBold30 = _baseNormalWhite.copyWith(fontSize: 30, fontWeight: FontWeight.bold);
  static  TextStyle fontBold16Black = _baseBoldBlack.copyWith(fontSize: 16);
  static  TextStyle fontBold14 = _baseNormalWhite.copyWith(fontSize: 14, fontWeight: FontWeight.bold);
}