import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/item_model.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/cart_notifier.dart';
import 'package:flutter_flow_assessment/features/orders/widgets/minus_button.dart';
import 'package:flutter_flow_assessment/features/orders/widgets/plus_button.dart';
import 'package:flutter_flow_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderCountTile extends ConsumerWidget {
  final ItemModel model;
  const OrderCountTile({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MinusButton(
          onTap: () => ref
              .watch(cartNotifier.notifier)
              .minusCart(context: context, item: model),
        ),
        10.sbW,
        Text(
          model.quantity.toString(),
          style: AppTextStyles.body4RegularPoppins(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        10.sbW,
        PlusButton(
          onTap: () => ref
              .watch(cartNotifier.notifier)
              .addCart(context: context, item: model),
        ),
      ],
    );
  }
}
