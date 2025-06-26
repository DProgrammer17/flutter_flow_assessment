import 'dart:convert';

import 'package:flutter_flow_assessment/core/network/model/request/order_item_request.dart';
import 'package:flutter_flow_assessment/core/network/net_utils/endpoints.dart';
import 'package:http/http.dart' as http;

class OrderSummaryApi {
  var client = http.Client();
  Future<bool> postOrderSummary(OrderListRequest request) async {
    final response = await client.post(
      Uri.parse(Endpoints.orderSummary),
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}