import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';

class AppSmallButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  const AppSmallButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 16.aw),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.ar),
          color: AppColors.primaryOrange,
        ),
        child: Text(
          buttonTitle,
          style: AppTextStyles.body4RegularPoppins(
            context,
          ).copyWith(color: AppColors.neutralWhite),
        ),
      ),
    );
  }
}
