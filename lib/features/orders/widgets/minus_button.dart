import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';

class MinusButton extends StatelessWidget {
  final VoidCallback onTap;
  const MinusButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 24.ah,
        width: 24.aw,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryOrange,
        ),
        child: Icon(Icons.remove, size: 12.ar, color: AppColors.neutralWhite),
      ),
    );
  }
}
