import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';
import 'package:flutter_flow_assessment/features/orders/state/bmi/bmi_notifier.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/cart_notifier.dart';
import 'package:flutter_flow_assessment/features/orders/ui/order_summary_page.dart';
import 'package:flutter_flow_assessment/features/orders/widgets/info_tile.dart';
import 'package:flutter_flow_assessment/features/orders/widgets/order_detail_tile.dart';
import 'package:flutter_flow_assessment/utils/extensions/navigation.dart';
import 'package:flutter_flow_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter_flow_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/app_button.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/header_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateOrderPage extends ConsumerStatefulWidget {
  const CreateOrderPage({super.key});

  @override
  ConsumerState<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends ConsumerState<CreateOrderPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cartNotifier.notifier).clearProducts();
      ref.read(cartNotifier.notifier).retrieveVegetables(context);
      ref.read(cartNotifier.notifier).retrieveMeats(context);
      ref.read(cartNotifier.notifier).retrieveCarbs(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HeaderAppBar(
        title: AppStrings.createYourOrder,
        onTap: () => ref.watch(cartNotifier.notifier).clearProducts(),
      ),
      body: Builder(
        builder: (context) {
          if(ref.watch(cartNotifier).isLoading){
            return Column(
              children: [
                240.sbH,
                Center(
                  child: SizedBox(
                    height: 80.ah,
                    width: 80.aw,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryOrange,
                    ),
                  ),
                ),
              ],
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.sbH,
                Text(
                  AppStrings.vegetables,
                  style: AppTextStyles.h4Poppins(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                10.sbH,
                SizedBox(
                  height: 205.ah,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      ref
                          .watch(cartNotifier)
                          .summaryList
                          .where((e) => e.category.contains(AppStrings.vegetables))
                          .length,
                      (index) => OrderDetailTile(
                        model: ref
                            .watch(cartNotifier)
                            .summaryList
                            .where(
                              (e) => e.category.contains(AppStrings.vegetables),
                            )
                            .elementAt(index),
                      ),
                    ),
                  ),
                ),
                24.sbH,
                Text(
                  AppStrings.meats,
                  style: AppTextStyles.h4Poppins(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                10.sbH,
                SizedBox(
                  height: 205.ah,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      ref
                          .watch(cartNotifier)
                          .summaryList
                          .where((e) => e.category.contains(AppStrings.meats))
                          .length,
                      (index) => OrderDetailTile(
                        model: ref
                            .watch(cartNotifier)
                            .summaryList
                            .where((e) => e.category.contains(AppStrings.meats))
                            .elementAt(index),
                      ),
                    ),
                  ),
                ),
                24.sbH,
                Text(
                  AppStrings.carbs,
                  style: AppTextStyles.h4Poppins(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                10.sbH,
                SizedBox(
                  height: 205.ah,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      ref
                          .watch(cartNotifier)
                          .summaryList
                          .where((e) => e.category.contains(AppStrings.carbs))
                          .length,
                      (index) => OrderDetailTile(
                        model: ref
                            .watch(cartNotifier)
                            .summaryList
                            .where((e) => e.category.contains(AppStrings.carbs))
                            .elementAt(index),
                      ),
                    ),
                  ),
                ),
                200.sbH,
              ],
            ),
          );
        }
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
            isDisabled: ValueNotifier(
              ref.watch(cartNotifier).disableOrderButton,
            ),
            onTap: () => context.pushSuper(OrderSummaryPage()),
            title: AppStrings.placeOrder,
          ),
          34.sbH,
        ],
      ),
    );
  }
}
