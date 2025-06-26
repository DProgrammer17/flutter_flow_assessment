import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';
import 'package:flutter_flow_assessment/features/orders/state/bmi/bmi_notifier.dart';
import 'package:flutter_flow_assessment/features/orders/ui/create_order_page.dart';
import 'package:flutter_flow_assessment/utils/extensions/navigation.dart';
import 'package:flutter_flow_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter_flow_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/app_button.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/app_text_field.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/dropdowns/app_platform_dropdown.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/header_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnterYourDetailsPage extends ConsumerWidget {
  const EnterYourDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: HeaderAppBar(title: AppStrings.enterYourDetails),
      body: Form(
        key: ref.watch(bmiNotifier).bmiFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            31.sbH,
            Text(
              AppStrings.gender,
              style: AppTextStyles.body2RegularPoppins(
                context,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
            10.sbH,
            AppPlatformDropdown(
              withHint: false,
              onChanged: (gender) =>
                  ref.watch(bmiNotifier.notifier).updateGender(gender),
              items: [AppStrings.male, AppStrings.female],
              dropdownValue: ValueNotifier(ref.watch(bmiNotifier).gender),
            ),
            12.sbH,
            AppTextfield(
              horizontalPadding: 0,
              controller: ref.watch(bmiNotifier).weightController,
              outerTitle: AppStrings.weight,
              hintText: AppStrings.weightHint,
              inputType: TextInputType.number,
              onChanged: (value) =>
                  ref.watch(bmiNotifier.notifier).validateForm(),
              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 12.ah),
                child: Text(
                  AppStrings.kg,
                  style: AppTextStyles.body2RegularPoppins(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            AppTextfield(
              horizontalPadding: 0,
              controller: ref.watch(bmiNotifier).heightController,
              outerTitle: AppStrings.height,
              hintText: AppStrings.heightHint,
              inputType: TextInputType.number,
              onChanged: (value) =>
                  ref.watch(bmiNotifier.notifier).validateForm(),
              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 12.ah),
                child: Text(
                  AppStrings.cm,
                  style: AppTextStyles.body2RegularPoppins(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            AppTextfield(
              horizontalPadding: 0,
              controller: ref.watch(bmiNotifier).ageController,
              outerTitle: AppStrings.age,
              hintText: AppStrings.ageHint,
              inputType: TextInputType.number,
              onChanged: (value) =>
                  ref.watch(bmiNotifier.notifier).validateForm(),
            ),
            // 32.sbH,
            // RichText(
            //   text: TextSpan(
            //     text: AppStrings.bmi,
            //     style: AppTextStyles.h2Poppins(
            //       context,
            //     ).copyWith(fontSize: 20.asp),
            //     children: [
            //       TextSpan(
            //         text: AppStrings.bmi,
            //         style: AppTextStyles.h2Poppins(
            //           context,
            //         ).copyWith(fontSize: 20.asp),
            //       ),
            //     ],
            //   ),
            // ),
            const Spacer(),
            AppButton(
              isDisabled: ValueNotifier(ref.watch(bmiNotifier).disableButton),
              onTap: () => context.pushSuper(CreateOrderPage()),
              title: AppStrings.nextText,
            ),
          ],
        ),
      ),
    );
  }
}
