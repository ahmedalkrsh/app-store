import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';


class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              Text('${product.ratingsAverage} (${product.ratingsQuantity} reviews)'),
            ],
          ),
          Text(
            '\$${product.price}',
            style: const TextStyle(fontSize: 20, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
