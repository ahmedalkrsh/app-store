import 'package:flutter/material.dart';
import 'package:mystore/Features/auth/presentation/views/register_view.dart';
import 'package:mystore/Features/cart/presentation/views/cart_view.dart';
import 'package:mystore/Features/home/presentation/views/product_view.dart';

import '../../Features/auth/presentation/views/login_view.dart';

class OnGenrateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RegisterView.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case ProductView.routeName:
        return MaterialPageRoute(builder: (_) => const ProductView());
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => const LoginView());
       case CartView.routeName:
        return MaterialPageRoute(builder: (_) => const CartView());
      default: 
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: Center(child: Text('Page Not Found'))));
    }
  }
}
