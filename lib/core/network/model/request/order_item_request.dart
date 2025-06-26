class OrderListRequest {
  final List<OrderItemRequest>? items;

  OrderListRequest({
    this.items,
  });

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : items!.map((item) => item.toJson()).toList(),
  };
}

class OrderItemRequest {
  final String name;
  final int totalPrice;
  final int quantity;

  OrderItemRequest({
    required this.name,
    required this.totalPrice,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "total_price": totalPrice,
    "quantity": quantity,
  };
}
