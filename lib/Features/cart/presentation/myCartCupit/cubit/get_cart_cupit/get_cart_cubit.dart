import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart'; // استيراد Logger
import 'package:mystore/Features/cart/data/models/cart_rsponce_mpdel.dart';
import 'package:mystore/Features/cart/data/repo/cart_repo.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  final CartRepository _cartRepository;
  final Logger _logger = Logger(); // إنشاء مثيل لـ Logger

  GetCartCubit(this._cartRepository) : super(GetCartInitial());

  Future<void> getCart() async {
    _logger.i('Fetching cart data...'); // تسجيل بداية العملية
    emit(GetCartLoading());

    try {
      final cart = await _cartRepository.getCart();
      _logger.i('Cart data fetched successfully: $cart'); // تسجيل البيانات بنجاح
      emit(GetCartLoaded(cartItems: [cart]));
    } catch (e) {
      _logger.e('Error fetching cart data',error: e); // تسجيل الخطأ مع تفاصيل stack trace
      emit(GetCartError(message: e.toString()));
    }
  }
}
