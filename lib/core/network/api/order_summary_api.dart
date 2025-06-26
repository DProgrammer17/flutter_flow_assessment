import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/core/network/model/request/order_item_request.dart';
import 'package:flutter_flow_assessment/core/network/net_utils/endpoints.dart';
import 'package:flutter_flow_assessment/widgets/utility_widgets/app_toast.dart';
import 'package:http/http.dart' as http;

class OrderSummaryApi {
  var client = http.Client();
  Future<bool> postOrderSummary({required BuildContext context,required OrderListRequest request}) async {
    final response = await client.post(
      Uri.parse(Endpoints.orderSummary),
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      if(context.mounted){
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.productsUploadedSuccessfully,
        );
      }
      return true;
    }

    if(context.mounted){
      AppMessages.showErrorMessage(
        context: context,
        message: ErrorStrings.somethingWentWrong,
      );
    }
    return false;
  }
}