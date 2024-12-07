import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mystore/Features/cart/presentation/myCartCupit/cubit/add_to_cart/my_cart_cubit.dart';

class ProductActionButtons extends StatelessWidget {
  final String productId;

  const ProductActionButtons({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                context.read<MyCartCubit>().addProductToCart(productId);
              },
              child: const Text('Add to Cart'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // منطق الشراء المباشر
              },
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}
