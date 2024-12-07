import 'package:equatable/equatable.dart';
import 'package:mystore/Features/cart/data/models/cart_model.dart';

abstract class MyCartState extends Equatable {
  @override
  List<Object> get props => [];
}

class MyCartInitial extends MyCartState {}

class MyCartLoading extends MyCartState {}

class MyCartLoaded extends MyCartState {
  final List<CartProduct> cartItems;  // قائمة المنتجات في السلة
  final int cartCount;  // عدد المنتجات في السلة
  final int totalPrice;  // السعر الإجمالي للسلة

  MyCartLoaded({
    required this.cartItems,
    required this.cartCount,
    required this.totalPrice,
  });

  @override
  List<Object> get props => [cartItems, cartCount, totalPrice];
}


class MyCartError extends MyCartState {
  final String message;

  MyCartError({required this.message});

  @override
  List<Object> get props => [message];
}

