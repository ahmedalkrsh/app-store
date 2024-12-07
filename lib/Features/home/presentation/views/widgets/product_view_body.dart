import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/Features/cart/presentation/myCartCupit/cubit/add_to_cart/my_cart_cubit.dart';
import 'package:mystore/Features/cart/presentation/myCartCupit/cubit/add_to_cart/my_cart_state.dart';

import 'package:mystore/Features/cart/presentation/views/cart_view.dart';
import 'package:mystore/Features/home/presentation/views/widgets/custom_cart_icon.dart';
import 'package:mystore/Features/home/presentation/views/widgets/product_image_crousel.dart';
import '../../cupit/get_prduct_cubit.dart';
import 'product_actions_button.dart';
import 'product_description.dart';
import 'product_details.dart';


class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPrductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          final product = state.product;

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageCarousel(images: product.images),
                  ProductDetails(product: product),
                  ProductDescription(description: product.description),
                  ProductActionButtons(productId: product.id),
                ],
              ),
            ),
            floatingActionButton: BlocBuilder<MyCartCubit, MyCartState>(
              builder: (context, cartState) {
                int cartCount = 0;
                if (cartState is MyCartLoaded) {
                  cartCount = cartState.cartCount;
                }
                return CartIconButton(
                  onPressed: () {
                   
                    Navigator.of(context).pushReplacementNamed(CartView.routeName);
                  },
                  cartCount: cartCount,
                );
              },
            ),
          );
        } else if (state is ProductError) {
          return Center(
            child: Text(
              state.failure.errroMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}

