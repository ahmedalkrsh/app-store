
import 'package:mystore/Features/cart/data/models/cart_model.dart';
import 'package:mystore/Features/cart/data/models/cart_rsponce_mpdel.dart';
import 'package:mystore/core/api_services.dart';

class CartRepository {
  final ApiService _apiService;

  CartRepository(this._apiService);

  Future<AddToCartResponse> addToCart(String productId) async {
    try {
      final response = await _apiService.addToCart(productId);
      return response; 
    } catch (e) {
      print('Error in CartRepository: $e');
      rethrow;
    }
  }
  Future<CartResponseModel>getCart()async{
    try {
      final response = await _apiService.getCart();
      return response;
    } catch (e) {
      print('Error in CartRepository: $e');
      rethrow;
    }
  }
 
}
