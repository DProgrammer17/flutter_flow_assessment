import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/core/network/api/order_summary_api.dart';
import 'package:flutter_flow_assessment/core/network/api/product_retreival_api.dart';
import 'package:flutter_flow_assessment/core/network/model/request/order_item_request.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/item_model.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/cart_vm.dart';
import 'package:flutter_flow_assessment/features/welcome/welcome_page.dart';
import 'package:flutter_flow_assessment/utils/extensions/navigation.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/app_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartNotifier = NotifierProvider<CartNotifier, CartVM>(() {
  return CartNotifier();
});

class CartNotifier extends Notifier<CartVM> {
  @override
  CartVM build() => CartVM();

  void clearProducts() => state = state.copyWith(summaryList: const [], totalCalories: 0, totalCost: 0,);

  Future<void> retrieveVegetables(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final vegetables = await ProductRetrievalApi().fetchVegetables(context);

    List<ItemModel> interimList = state.summaryList.toList();
    interimList = interimList
      ..addAll(
        List<ItemModel>.from(
          vegetables.products.map(
            (x) => ItemModel(
              image: x.imageUrl ?? '',
              price: x.price ?? 0,
              quantity: 0,
              calories: x.calories ?? 0,
              name: x.foodName ?? '',
              category: AppStrings.vegetables,
            ),
          ),
        ),
      );
    state = state.copyWith(summaryList: interimList.toList(), isLoading: false);
  }

  Future<void> retrieveMeats(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final meats = await ProductRetrievalApi().fetchMeats(context);

    List<ItemModel> interimList = state.summaryList.toList();
    interimList = interimList
      ..addAll(
        List<ItemModel>.from(
          meats.products.map(
            (x) => ItemModel(
              image: x.imageUrl ?? '',
              price: x.price ?? 0,
              quantity: 0,
              calories: x.calories ?? 0,
              name: x.foodName ?? '',
              category: AppStrings.meats,
            ),
          ),
        ),
      );
    state = state.copyWith(summaryList: interimList.toList(), isLoading: false);
  }

  Future<void> retrieveCarbs(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final carbs = await ProductRetrievalApi().fetchCarbs(context);

    List<ItemModel> interimList = state.summaryList.toList();
    interimList = interimList
      ..addAll(
        List<ItemModel>.from(
          carbs.products.map(
            (x) => ItemModel(
              image: x.imageUrl ?? '',
              price: x.price ?? 0,
              quantity: 0,
              calories: x.calories ?? 0,
              name: x.foodName ?? '',
              category: AppStrings.carbs,
            ),
          ),
        ),
      );
    state = state.copyWith(summaryList: interimList.toList(), isLoading: false);
  }

  void updateOrderButton() {
    if (state.summaryList.isNotEmpty) {
      state = state.copyWith(disableOrderButton: false);
      return;
    }
    state = state.copyWith(disableOrderButton: true);
  }

  void addToCart({required BuildContext context, required ItemModel item}) {
    List<ItemModel> interimCart = state.summaryList.toList();

    if (state.summaryList.isEmpty ||
        state.summaryList
                .firstWhere((e) => e.name.contains(item.name))
                .quantity <=
            0) {
      interimCart = interimCart.toList()..add(item);
      state = state.copyWith(summaryList: interimCart.toList());
      totalAmount();
      updateOrderButton();
      AppMessages.showSuccessMessage(
        context: context,
        message: ErrorStrings.itemAddedToCart,
      );
      return;
    }
    return;
  }

  void minusCart({required BuildContext context, required ItemModel item}) {
    List<ItemModel> interimCart = state.summaryList.toList();

    if (!state.summaryList.any((e) => e.name.contains(item.name))) {
      AppMessages.showErrorMessage(
        context: context,
        message: ErrorStrings.actionNotPossible,
      );
      return;
    }

    ItemModel editModel = interimCart.firstWhere((e) => e.name == item.name);
    if ((editModel.quantity - 1) <= 0) {
      deleteFromCart(item: item);
      return;
    }

    ItemModel updatedModel = ItemModel(
      name: editModel.name,
      price: editModel.price,
      category: editModel.category,
      calories: editModel.calories,
      quantity: (editModel.quantity - 1),
      image: editModel.image,
    );
    interimCart = interimCart..removeWhere((e) => e.name.contains(item.name));
    interimCart = interimCart.toList()..add(updatedModel);
    state = state.copyWith(summaryList: interimCart);
    totalAmount();
    updateOrderButton();
    return;
  }

  void addCart({required BuildContext context, required ItemModel item}) {
    List<ItemModel> interimCart = state.summaryList.toList();

    if (!state.summaryList.any((e) => e.name.contains(item.name))) {
      interimCart = interimCart..toList().add(item);
      state = state.copyWith(summaryList: interimCart);
      totalAmount();
      updateOrderButton();
      return;
    }

    ItemModel editModel = interimCart.firstWhere((e) => e.name == item.name);

    ItemModel updatedModel = ItemModel(
      name: editModel.name,
      price: editModel.price,
      calories: editModel.calories,
      quantity: (editModel.quantity + 1),
      category: editModel.category,
      image: editModel.image,
    );

    interimCart = interimCart..removeWhere((e) => e.name.contains(item.name));
    interimCart = interimCart.toList()..add(updatedModel);
    state = state.copyWith(summaryList: interimCart);
    totalAmount();
    updateOrderButton();

    if (state.summaryList
            .firstWhere((e) => e.name.contains(item.name))
            .quantity <=
        0) {
      AppMessages.showSuccessMessage(
        context: context,
        message: ErrorStrings.itemAddedToCart,
      );
    }
    return;
  }

  void deleteFromCart({required ItemModel item}) {
    List<ItemModel> interimCart = state.summaryList.toList();
    interimCart = interimCart..removeWhere((e) => e.name == item.name);
    state = state.copyWith(summaryList: interimCart);
    totalAmount();
    updateOrderButton();
  }

  void totalAmount() {
    List<ItemModel> interimCart = state.summaryList.toList();
    double total = 0;
    for (int i = 0; i < interimCart.length; i++) {
      total =
          total +
          (interimCart.elementAt(i).price * interimCart.elementAt(i).quantity);
    }

    double calories = 0;
    for (int i = 0; i < interimCart.length; i++) {
      calories = calories + interimCart.elementAt(i).calories;
    }
    state = state.copyWith(totalCost: total, totalCalories: calories);
  }

  Future<void> submitOrder(BuildContext context) async {
    List<OrderItemRequest> interimList = state.orderList.toList();
    interimList = interimList
      ..addAll(
        List<OrderItemRequest>.from(
          state.summaryList.map(
            (x) => OrderItemRequest(
              name: x.name,
              totalPrice: (x.price.toInt() * x.quantity),
              quantity: x.quantity,
            ),
          ),
        ),
      );
    state = state.copyWith(orderList: interimList.toList());

    bool result = await OrderSummaryApi().postOrderSummary(
      context: context,
      request: OrderListRequest(items: state.orderList),
    );

    if (result) {
      if (context.mounted) {
        context.pushAndPopAllSuper(WelcomePage());
      }
      return;
    }
  }
}
