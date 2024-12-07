import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/Features/cart/presentation/myCartCupit/cubit/get_cart_cupit/get_cart_cubit.dart';
import 'package:mystore/Features/cart/presentation/views/widgets/cart_item_widget.dart';


class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetCartCubit>().getCart();
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        if (state is GetCartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetCartLoaded) {
          final cartItems = state.cartItems;

          if (cartItems.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }

          return ListView.builder(
            itemCount: cartItems.first.data.products.length,
            itemBuilder: (context, index) {
              final product = cartItems.first.data.products[index];

              return CartItemWidget(
                title: product.product.title,
                imageUrl: product.product.imageCover,
                price: product.price,
                quantity: product.count,
              );
            },
          );
        } else if (state is GetCartError) {
          return Center(
            child: Text('Error: ${state.message}'),
          );
        }

        return const Center(
          child: Text('No data available'),
        );
      },
    );
  }
}
