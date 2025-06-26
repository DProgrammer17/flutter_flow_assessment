import 'package:flutter_flow_assessment/core/network/model/request/order_item_request.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/item_model.dart';

class CartVM{
  final bool disableOrderButton;
  final List<ItemModel> summaryList;
  final List<OrderItemRequest> orderList;
  final double totalCost;
  final double totalCalories;
  final bool isLoading;

  const CartVM({
    this.disableOrderButton = true,
    this.totalCost = 0,
    this.totalCalories = 0,
    this.orderList = const [],
    this.summaryList = const [],
    this.isLoading = false,
});

  CartVM copyWith({
    bool? disableOrderButton,
    List<ItemModel>? summaryList,
    List<OrderItemRequest>? orderList,
    double? totalCalories,
    double? totalCost,
    bool? isLoading,
}){
    return CartVM(
      disableOrderButton: disableOrderButton ?? this.disableOrderButton,
      summaryList: summaryList ?? this.summaryList,
      orderList: orderList ?? this.orderList,
      totalCost: totalCost ?? this.totalCost,
      totalCalories: totalCalories ?? this.totalCalories,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}