import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';
import 'package:flutter_flow_assessment/features/orders/state/bmi/bmi_notifier.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/cart_notifier.dart';
import 'package:flutter_flow_assessment/features/orders/widgets/info_tile.dart';
import 'package:flutter_flow_assessment/features/orders/widgets/summary_order_tile.dart';
import 'package:flutter_flow_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter_flow_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/app_button.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/header_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderSummaryPage extends ConsumerWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: HeaderAppBar(title: AppStrings.orderSummary),
      body: Padding(
        padding: EdgeInsets.only(top: 16.ah),
        child: ListView(
          children: List.generate(
            ref
                .watch(cartNotifier)
                .summaryList
                .where((e) => e.quantity > 0)
                .length,
            (index) => SummaryOrderTile(
              model: ref
                  .watch(cartNotifier)
                  .summaryList
                  .where((e) => e.quantity > 0)
                  .elementAt(index),
            ),
          ),
        ),
      ),
      bottomSheet: Column(
        children: [
          InfoTile(
            title: AppStrings.cal,
            info: AppStrings.calCount(
              calories: ref.watch(cartNotifier).totalCalories,
              bmi: ref.watch(bmiNotifier).bmi ?? 0,
            ),
          ),
          InfoTile(
            title: AppStrings.price,
            info: AppStrings.itemPrice(ref.watch(cartNotifier).totalCost),
            infoStyle: AppTextStyles.body4RegularPoppins(context).copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryOrange,
            ),
          ),
          8.sbH,
          AppButton(
            onTap: () => ref.watch(cartNotifier.notifier).submitOrder(context),
            title: AppStrings.confirm,
          ),
          34.sbH,
        ],
      ),
    );
  }
}
