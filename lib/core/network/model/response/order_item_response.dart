class OrderItemResponse{
  final List<OrderItemData> products;

  OrderItemResponse({
    this.products = const [],
});

  factory OrderItemResponse.fromJson(List<Map<String, dynamic>> json) =>
      OrderItemResponse(
        products: List<OrderItemData>.from(json.map((x) => OrderItemData.fromJson(x))),
      );
}

class OrderItemData {
  final String? foodName;
  final int? calories;
  final double? price;
  final String? imageUrl;

  OrderItemData({
    this.foodName,
    this.calories,
    this.price,
    this.imageUrl,
  });

  factory OrderItemData.fromJson(Map<String, dynamic> json) => OrderItemData(
    foodName: json["food_name"],
    calories: json["calories"],
    price: json["price"]?.toDouble(),
    imageUrl: json["image_url"],
  );
}
