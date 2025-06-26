import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';
import 'package:flutter_flow_assessment/utils/extensions/navigation.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? appBarColor;
  final double? height;
  final String title;
  final VoidCallback? onTap;
  const HeaderAppBar({
    super.key,
    required this.title,
    this.appBarColor,
    this.height,
    this.onTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(76.ah);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      foregroundColor: appBarColor ?? AppColors.neutralWhite,
      elevation: 0,
      backgroundColor: appBarColor ?? AppColors.neutralWhite,
      centerTitle: true,
      leading: InkWell(
        onTap: (){
          context.popSuper();
          onTap?.call();
        },
        child: Icon(
          Icons.arrow_left_sharp,
          size: 28.ar,
          color: AppColors.textBlack,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.h2Poppins(context).copyWith(
          fontSize: 20.asp,
        ),
      ),
    );
  }
}
