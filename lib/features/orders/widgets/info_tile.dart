import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String info;
  final TextStyle? titleStyle;
  final TextStyle? infoStyle;
  const InfoTile({
    super.key,
    required this.title,
    required this.info,
    this.titleStyle,
    this.infoStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.ah),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle ?? AppTextStyles.body4RegularPoppins(context),
          ),
          Text(
            info,
            style:
                infoStyle ??
                AppTextStyles.body2RegularPoppins(
                  context,
                ).copyWith(color: AppColors.textGreyLight),
          ),
        ],
      ),
    );
  }
}
