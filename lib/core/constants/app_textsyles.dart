import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/utils/extensions/layout_helper.dart';

abstract class AppTextStyles {
  static TextStyle h1AbhayaBold(BuildContext context) => TextStyle(
    fontFamily: AppStrings.abhayaFontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.textBlack,
    fontSize: context.isMobile ? 24.asp : 10.asp,
  );

  static TextStyle h2AbhayaBold (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.abhayaFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.textBlack,
    fontSize: 14.asp,
  );

  static TextStyle h3AbhayaBold (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.abhayaFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
    fontSize: 16.asp,
  );

  static TextStyle h4AbhayaBold (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.abhayaFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
    fontSize: 20.asp,
  );

  static TextStyle h5AbhayaBold (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.abhayaFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
    fontSize: 18.asp,
  );

  static TextStyle h1Poppins(BuildContext context) => TextStyle(
    fontFamily: AppStrings.poppinsFontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.textBlack,
    fontSize: context.isMobile ? 28.asp : 14.asp,
  );

  static TextStyle h2Poppins (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.poppinsFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.textBlack,
    fontSize: 14.asp,
  );

  static TextStyle h3Poppins (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.poppinsFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
    fontSize: 16.asp,
  );

  static TextStyle h4Poppins (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.poppinsFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
    fontSize: 20.asp,
  );

  static TextStyle h5Poppins (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.poppinsFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
    fontSize: 18.asp,
  );

  static TextStyle body1RegularPoppins (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.poppinsFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontSize: context.isMobile ? 12.asp : 8.asp,
  );

  static TextStyle body2RegularPoppins (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.poppinsFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontSize:context.isMobile ? 14.asp : 8.asp,
  );

  static TextStyle body3RegularPoppins (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.poppinsFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontSize: 10.asp,
  );

  static TextStyle body4RegularPoppins (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.poppinsFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontSize:context.isMobile ? 16.asp : 10.asp,
  );

  static TextStyle bodyRegularQuestrial (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.questrialFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontSize:context.isMobile ? 14.asp : 8.asp,
  );
}