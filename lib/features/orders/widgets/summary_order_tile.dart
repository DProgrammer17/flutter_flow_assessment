import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_colors.dart';
import 'package:flutter_flow_assessment/core/constants/app_constants.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/core/constants/app_textsyles.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/item_model.dart';
import 'package:flutter_flow_assessment/features/orders/widgets/info_tile.dart';
import 'package:flutter_flow_assessment/features/orders/widgets/order_count_tile.dart';
import 'package:flutter_flow_assessment/utils/extensions/widget_extensions.dart';

class SummaryOrderTile extends StatelessWidget {
  final ItemModel model;
  const SummaryOrderTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.ah),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 10.aw),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.ar),
          color: AppColors.neutralWhite,
          boxShadow: [
            BoxShadow(
              color: AppColors.textGreyLight2.withOpacity(0.14),
              spreadRadius: 0.4,
              blurRadius: 10,
              offset: Offset(3, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.ar),
              child: Image.network(
                model.image,
                height: 62.ah,
                width: 76.aw,
                fit: BoxFit.contain,
              ),
            ),
            10.sbW,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoTile(
                    title: model.name,
                    info: AppStrings.itemPrice(model.price),
                    infoStyle: AppTextStyles.h3Poppins(
                      context,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                  8.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.calAmount(model.calories),
                        style: AppTextStyles.body2RegularPoppins(
                          context,
                        ).copyWith(color: AppColors.textGreyLight),
                      ),
                      OrderCountTile(model: model),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
