import 'package:flutter/material.dart';

class CartIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final int cartCount;

  const CartIconButton({
    super.key,
    required this.onPressed,
    this.cartCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: onPressed,
          child: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
        ),
        if (cartCount > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$cartCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
