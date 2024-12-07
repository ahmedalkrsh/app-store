part of 'get_prduct_cubit.dart';



abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;

  ProductLoaded({required this.product});
}

class ProductError extends ProductState {
  final Failure failure;

  ProductError({required this.failure});
}
