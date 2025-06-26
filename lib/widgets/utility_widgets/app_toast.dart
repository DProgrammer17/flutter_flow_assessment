import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/utils/enums/snackbar_type.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/app_snackbar_tile.dart';

abstract class AppMessages {
  static void showInfoMessage({
    required BuildContext context,
    required String message,
  }) => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      duration: Duration(milliseconds: 1000),
      backgroundColor: AppColors.primaryOrange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.ar)),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(
        bottom: AppConstants.deviceHeight - 130.ah,
        left: 10.aw,
        right: 10.aw,
      ),
      behavior: SnackBarBehavior.floating,
      content: AppSnackBarTile(message: message, type: SnackBarType.info),
    ),
  );

  static void showSuccessMessage({
    required BuildContext context,
    required String message,
  }) => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      duration: Duration(milliseconds: 1000),
      backgroundColor: AppColors.onlineGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.ar)),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(
        bottom: AppConstants.deviceHeight - 130.ah,
        left: 10.aw,
        right: 10.aw,
      ),
      behavior: SnackBarBehavior.floating,
      content: AppSnackBarTile(message: message, type: SnackBarType.success),
    ),
  );

  static void showErrorMessage({
    required BuildContext context,
    required String message,
  }) => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      duration: Duration(milliseconds: 1000),
      backgroundColor: AppColors.failRed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.ar)),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(
        bottom: AppConstants.deviceHeight - 130.ah,
        left: 10.aw,
        right: 10.aw,
      ),
      behavior: SnackBarBehavior.floating,
      content: AppSnackBarTile(message: message, type: SnackBarType.error),
    ),
  );
}
