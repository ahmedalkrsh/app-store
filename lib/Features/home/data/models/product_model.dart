class Product {
  String id;
  String title;
  String description;
  double price;
  int quantity;
  int sold;
  double ratingsAverage;
  int ratingsQuantity;
  String imageCover;
  List<String> images;
  String category;
  String subcategory;
  String? brand; // قد تكون غير موجودة
  DateTime createdAt;
  DateTime updatedAt;

  // Constructor
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.sold,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.imageCover,
    required this.images,
    required this.category,
    required this.subcategory,
    this.brand,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a Product object from JSON
 factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    id: json['_id'] ?? '',
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    price: (json['price'] ?? 0).toDouble(),
    quantity: json['quantity'] ?? 0,
    sold: json['sold'] ?? 0,
    ratingsAverage: (json['ratingsAverage'] ?? 0).toDouble(),
    ratingsQuantity: json['ratingsQuantity'] ?? 0,
    imageCover: json['imageCover'] ?? '',
    images: List<String>.from(json['images'] ?? []),
    category: json['category']?['name'] ?? 'Unknown',
    subcategory: json['subcategory'] != null && json['subcategory'].isNotEmpty
        ? json['subcategory'][0]['name'] ?? 'Unknown'
        : 'Unknown',
    brand: json['brand']?['name'] ?? 'Unknown',
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
  );
}


  // Method to convert a Product object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'price': price,
      'quantity': quantity,
      'sold': sold,
      'ratingsAverage': ratingsAverage,
      'ratingsQuantity': ratingsQuantity,
      'imageCover': imageCover,
      'images': images,
      'category': category,
      'subcategory': subcategory,
      'brand': brand,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
