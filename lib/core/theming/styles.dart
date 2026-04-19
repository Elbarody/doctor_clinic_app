import 'package:doctor_opportunity/core/theming/colors.dart';
import 'package:doctor_opportunity/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.getFontWeight('bold'),
    color: Colors.black,
  );

  static TextStyle font32BlueBold = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.getFontWeight('bold'),
    color: ColorsManager.mainBlue,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.getFontWeight('semibold'),
    color: Colors.white,
  );

  static TextStyle font14BlueSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.getFontWeight('semibold'),
    color: ColorsManager.mainBlue,
  );

  static TextStyle font13BlueSemiBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.getFontWeight('semibold'),
    color: ColorsManager.mainBlue,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.getFontWeight('medium'),
    color: ColorsManager.darkBlue,
  );

  static TextStyle font15DarkBlueMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.getFontWeight('medium'),
    color: ColorsManager.darkBlue,
  );

  static TextStyle font13DarkBlueMedium = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.getFontWeight('medium'),
    color: ColorsManager.darkBlue,
  );

  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.getFontWeight('medium'),
    color: Colors.white,
  );

  static TextStyle font13BlueRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.getFontWeight('regular'),
    color: ColorsManager.mainBlue,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.getFontWeight('regular'),
    color: ColorsManager.gray,
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.getFontWeight('regular'),
    color: ColorsManager.darkBlue,
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.getFontWeight('regular'),
    color: ColorsManager.gray,
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.getFontWeight('regular'),
    color: ColorsManager.lightGray,
  );
}
