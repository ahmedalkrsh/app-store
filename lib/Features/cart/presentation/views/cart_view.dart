import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/Features/cart/presentation/myCartCupit/cubit/get_cart_cupit/get_cart_cubit.dart';
import 'package:mystore/Features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:mystore/Features/home/presentation/views/product_view.dart';
import 'package:mystore/core/get_it-service.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'CartView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCartCubit(getIt()),
      child:  Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          actions:  [
             IconButton(onPressed: (){
               Navigator.pushNamed(context, ProductView.routeName);
             }, icon: const Icon(Icons.arrow_back)),
          ],
        ),

        body:const CartViewBody(),
      ),
    );
  }
}
