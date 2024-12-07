class CartResponseModel {
  final String status;
  final int numOfCartItems;
  final String cartId;
  final CartData data;

  CartResponseModel({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.data,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
      status: json['status'],
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
  final ProductDetail product;
  final double price;

  CartProduct({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      count: json['count'],
      id: json['_id'],
      product: ProductDetail.fromJson(json['product']),
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}

class ProductDetail {
  final List<Subcategory> subcategory;
  final String id;
  final String title;
  final int quantity;
  final String imageCover;
  final Category category;
  final Brand brand;
  final double ratingsAverage;

  ProductDetail({
    required this.subcategory,
    required this.id,
    required this.title,
    required this.quantity,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      subcategory: (json['subcategory'] as List)
          .map((sub) => Subcategory.fromJson(sub))
          .toList(),
      id: json['_id'],
      title: json['title'],
      quantity: json['quantity'],
      imageCover: json['imageCover'],
      category: Category.fromJson(json['category']),
      brand: Brand.fromJson(json['brand']),
      ratingsAverage: (json['ratingsAverage'] ?? 0).toDouble(),
    );
  }
}

class Subcategory {
  final String id;
  final String name;
  final String slug;
  final String category;

  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }
}

class Category {
  final String id;
  final String name;
  final String slug;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}

class Brand {
  final String id;
  final String name;
  final String slug;
  final String image;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}
