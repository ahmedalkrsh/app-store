part of 'get_cart_cubit.dart';

sealed class GetCartState extends Equatable {
  const GetCartState();

  @override
  List<Object> get props => [];
}

final class GetCartInitial extends GetCartState {}

final class GetCartLoading extends GetCartState {}

final class GetCartLoaded extends GetCartState {
  final List<CartResponseModel> cartItems;

  const GetCartLoaded({required this.cartItems});
}

final class GetCartError extends GetCartState {
  final String message;

  const GetCartError({required this.message});
}