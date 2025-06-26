import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_assets.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';
import 'package:flutter_flow_assessment/core/network/api/product_retreival_api.dart';
import 'package:flutter_flow_assessment/features/orders/ui/enter_your_details_page.dart';
import 'package:flutter_flow_assessment/utils/extensions/navigation.dart';
import 'package:flutter_flow_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter_flow_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/app_button.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/empty_appbar.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: EmptyAppBar(appBarColor: Colors.transparent),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.welcomeImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.aw),
          child: Column(
            children: [
              48.sbH,
              Text(
                AppStrings.balancedMeal,
                style: AppTextStyles.h1AbhayaBold(context).copyWith(
                  fontSize: 48.asp,
                  color: AppColors.neutralWhite,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Text(
                AppStrings.welcomePageText,
                textAlign: TextAlign.center,
                style: AppTextStyles.h4Poppins(context).copyWith(
                  color: AppColors.neutralWhite,
                  fontWeight: FontWeight.w300,
                ),
              ),
              30.sbH,
              AppButton(
                onTap: () => context.pushSuper(EnterYourDetailsPage()),
                title: AppStrings.orderFood,
              ),
              43.sbH,
            ],
          ),
        ),
      ),
    );
  }
}
