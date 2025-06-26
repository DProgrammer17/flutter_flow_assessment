import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/item_model.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/cart_notifier.dart';
import 'package:flutter_flow_assessment/features/orders/widgets/order_count_tile.dart';
import 'package:flutter_flow_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/app_small_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDetailTile extends ConsumerWidget {
  final ItemModel model;
  const OrderDetailTile({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(right: 12.aw),
      padding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 10.aw),
      width: 183.aw,
      decoration: BoxDecoration(
        color: AppColors.neutralWhite,
        borderRadius: BorderRadius.circular(12.ar),
        boxShadow: [
          BoxShadow(
            color: AppColors.textGreyLight2.withOpacity(0.14),
            spreadRadius: 0.4,
            blurRadius: 10,
            offset: Offset(3, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 108.ah,
            width: 163.aw,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(model.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(6.ar),
            ),
          ),
          10.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100.aw,
                child: Text(
                  model.name,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body4RegularPoppins(context),
                ),
              ),
              Text(
                AppStrings.calAmount(model.calories),
                style: AppTextStyles.body2RegularPoppins(
                  context,
                ).copyWith(color: AppColors.textGreyLight),
              ),
            ],
          ),
          8.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.itemPrice(model.price),
                style: AppTextStyles.body4RegularPoppins(
                  context,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              model.quantity == 0
                  ? AppSmallButton(
                      buttonTitle: AppStrings.add,
                      onTap: () {
                        ref
                            .watch(cartNotifier.notifier)
                            .addCart(context: context, item: model);
                        print(model.quantity);
                      },
                    )
                  : OrderCountTile(model: model),
            ],
          ),
        ],
      ),
    );
  }
}
