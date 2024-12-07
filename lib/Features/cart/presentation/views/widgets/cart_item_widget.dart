import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;

  const CartItemWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Price: \$${price.toStringAsFixed(2)}'),
        trailing: Text('Qty: $quantity'),
      ),
    );
  }
}
