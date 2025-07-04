import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';
import 'package:flutter_flow_assessment/utils/extensions/widget_extensions.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? buttonIcon;
  final Widget? prefixButtonIcon;
  final String title;
  final double? height;
  final double? verticalPadding;
  final double? borderWidth;
  final double? width;
  final LinearGradient? gradient;
  final ValueNotifier<bool>? isLoading;
  final ValueNotifier<bool>? isDisabled;

  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.buttonColor,
    this.buttonIcon,
    this.prefixButtonIcon,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.height,
    this.verticalPadding,
    this.isLoading,
    this.width,
    this.isDisabled,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDisabled ?? ValueNotifier(false),
      builder: (context, bool value, _) {
        return ValueListenableBuilder(
          valueListenable: isLoading ?? ValueNotifier(false),
          builder: (context, bool loading, _) {
            return AbsorbPointer(
              absorbing: (value || loading) ? true : false,
              child: Opacity(
                opacity: loading ? 0.05 : 1.0,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                      vertical: verticalPadding ?? 10.ah,
                    ),
                    decoration: BoxDecoration(
                      gradient: gradient,
                      color:
                          buttonColor?.withOpacity(value ? 0.5 : 1) ??
                         (value ? AppColors.offWhite : AppColors.primaryOrange),
                      borderRadius: BorderRadius.all(Radius.circular(12.ar)),
                      border: Border.all(
                        color: borderColor ?? Colors.transparent,
                        width: borderWidth ?? 0,
                      ),
                    ),
                    child: loading
                        ? Theme(
                            data: ThemeData(
                              cupertinoOverrideTheme:
                                  const CupertinoThemeData(
                                    brightness: Brightness.dark,
                                  ),
                            ),
                            child: SizedBox(
                              width: 20.aw,
                              height: 20.ah,
                              child: const CupertinoActivityIndicator(),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.ah,
                              horizontal: 24.aw,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (prefixButtonIcon != null) ...[
                                    prefixButtonIcon!,
                                    8.sbW,
                                  ],
                                  Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.h2Poppins(context)
                                        .copyWith(
                                      fontSize: 16.asp,
                                          color:
                                              textColor ??
                                              (value ? AppColors.textGreyLight : AppColors.neutralWhite),
                                        ),
                                  ),
                                  if (buttonIcon != null) ...[
                                    8.sbW,
                                    buttonIcon!,
                                  ],
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
