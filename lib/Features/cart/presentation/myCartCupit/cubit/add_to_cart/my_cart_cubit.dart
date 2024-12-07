import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/Features/cart/data/models/cart_model.dart';
import 'package:mystore/Features/cart/data/repo/cart_repo.dart';
import 'package:mystore/Features/cart/presentation/myCartCupit/cubit/add_to_cart/my_cart_state.dart';

class MyCartCubit extends Cubit<MyCartState> {
  final CartRepository _cartRepository;

  MyCartCubit(this._cartRepository) : super(MyCartInitial());

  // إضافة منتج إلى السلة
  Future<void> addProductToCart(String productId) async {
    emit(MyCartLoading());  // عرض مؤشر التحميل
    try {
      // الحصول على الاستجابة عند إضافة المنتج
      final response = await _cartRepository.addToCart(productId);

      // استخراج البيانات من الاستجابة
      final List<CartProduct> cartItems = response.data.products;  // المنتجات في السلة
      final int totalPrice = response.data.totalCartPrice;  // السعر الإجمالي
      final int cartCount = response.numOfCartItems;  // عدد المنتجات في السلة

      // تحديث حالة السلة
      emit(MyCartLoaded(
        cartItems: cartItems,
        cartCount: cartCount,
        totalPrice: totalPrice,
      ));
    } catch (error) {
      emit(MyCartError(message: error.toString()));
    }
  }
}


