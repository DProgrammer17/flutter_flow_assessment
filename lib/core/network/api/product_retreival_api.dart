import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/core/network/model/response/order_item_response.dart';
import 'package:flutter_flow_assessment/core/network/net_utils/products_category.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/app_toast.dart';

class ProductRetrievalApi {
  Future<OrderItemResponse> fetchVegetables(BuildContext context) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(ProductCategory.vegetables.name)
          .get();

      final products = snapshot.docs.map((doc) => doc.data()).toList();
      final productList = OrderItemResponse.fromJson(products);
      print(products);
      if(context.mounted){
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.productsRetrievedSuccessfully,
        );
      }
      return productList;
    } catch (e) {
      print('Error fetching products: $e');
      if(context.mounted){
        AppMessages.showErrorMessage(
          context: context,
          message: e.toString(),
        );
      }
      return OrderItemResponse.fromJson([]);
    }
  }

  Future<OrderItemResponse> fetchMeats(BuildContext context) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(ProductCategory.meats.name)
          .get();

      final products = snapshot.docs.map((doc) => doc.data()).toList();
      final productList = OrderItemResponse.fromJson(products);
      print(products);
      if(context.mounted){
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.productsRetrievedSuccessfully,
        );
      }
      return productList;
    } catch (e) {
      print('Error fetching products: $e');
      if(context.mounted){
        AppMessages.showErrorMessage(
          context: context,
          message: e.toString(),
        );
      }
      return OrderItemResponse.fromJson([]);
    }
  }

  Future<OrderItemResponse> fetchCarbs(BuildContext context) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(ProductCategory.carbs.name)
          .get();

      final products = snapshot.docs.map((doc) => doc.data()).toList();
      final productList = OrderItemResponse.fromJson(products);
      print(products);
      if(context.mounted){
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.productsRetrievedSuccessfully,
        );
      }
      return productList;
    } catch (e) {
      print('Error fetching products: $e');
      if(context.mounted){
        AppMessages.showErrorMessage(
          context: context,
          message: e.toString(),
        );
      }
      return OrderItemResponse.fromJson([]);
    }
  }
}
