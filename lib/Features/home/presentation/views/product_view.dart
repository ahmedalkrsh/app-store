import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/Features/cart/presentation/myCartCupit/cubit/add_to_cart/my_cart_cubit.dart';
import 'package:mystore/Features/home/presentation/cupit/get_prduct_cubit.dart';

import 'package:mystore/Features/home/presentation/views/widgets/product_view_body.dart';
import 'package:mystore/core/get_it-service.dart';




class ProductView extends StatelessWidget {
  const ProductView({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    const String testProductId = '6428c5b7dc1175abc65ca019'; 

    return MultiBlocProvider( 
      providers: [
        BlocProvider(
          create: (context) => GetPrductCubit(getIt())..fetchProduct(testProductId),
        ),
        BlocProvider(
          create: (context) => MyCartCubit(getIt()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
        ),
        body: const ProductViewBody(),
      ),
    );
  }
}
