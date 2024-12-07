class AddToCartResponse {
  final String status;
  final String message;
  final int numOfCartItems;
  final String cartId;
  final CartData data;

  AddToCartResponse({
    required this.status,
    required this.message,
    required this.numOfCartItems,
    required this.cartId,
    required this.data,
  });

  // Factory method لتحويل JSON إلى كائن Dart
  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      status: json['status'],
      message: json['message'],
      numOfCartItems: json['numOfCartItems'],
      cartId: json['cartId'],
      data: CartData.fromJson(json['data']),
    );
  }
}

class CartData {
  final String id;
  final String cartOwner;
  final List<CartProduct> products;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int totalCartPrice;

  CartData({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.totalCartPrice,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['_id'],
      cartOwner: json['cartOwner'],
      products: (json['products'] as List)
          .map((product) => CartProduct.fromJson(product))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      totalCartPrice: json['totalCartPrice'],
    );
  }
}

class CartProduct {
  final int count;
  final String id;
  final String product;  // لا حاجة إلى تحويله إلى كائن
  final int price;

  CartProduct({
    required this.count,
    required this.id,
    required this.product, // سيكون مجرد ID
    required this.price,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      count: json['count'],
      id: json['_id'],
      product: json['product'], // الحفاظ على الـ ID فقط
      price: json['price'],
    );
  }
}
