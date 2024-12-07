import 'package:dio/dio.dart';
import 'package:mystore/Features/auth/data/models/sign.up.model.dart';
import 'package:mystore/Features/auth/data/models/signin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Features/cart/data/models/cart_model.dart';
import '../Features/cart/data/models/cart_rsponce_mpdel.dart';

class ApiService {
  final _baseUrl = 'https://ecommerce.routemisr.com/api/v1';
  final Dio _dio;

  ApiService(this._dio) {
    _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
        requestBody: true));
  }
   Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
    }
  Future<Map<String, dynamic>> registerUser(User userData,
      {required String endpoint}) async {
    try {
      var response = await _dio.post(
        '$_baseUrl$endpoint',
        data: userData.toJson(),
      );

      if (response.data != null && response.data.containsKey('user')) {
        return response.data;
      } else {
        throw Exception('Invalid response from server');
      }
    } catch (e) {
      print('Error during registration: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> loginUser(LoginUser signinDatta,
      {required String endpoint}) async {
    try {
      var response =
          await _dio.post('$_baseUrl$endpoint', data: signinDatta.toJson());

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Invalid response from server');
      }
    } on DioException catch (e) {
      print('Error during registration: $e');
      rethrow;
    }
    
  }
  Future<Map<String, dynamic>> getProduct(String productId) async {
    try {
      final response = await _dio.get('$_baseUrl/products/$productId');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to fetch product');
      }
    } on DioException catch (e) {
      print('Error during fetching product: $e');
      rethrow;
    }
    }
     
 Future<AddToCartResponse> addToCart(String productId) async {
  print("Sending productId: $productId"); 
  try {
    final token = await getToken();  // استرجاع التوكن
    final response = await _dio.post(
      '$_baseUrl/cart',
      data: {"productId": productId},
      options: Options(
        headers: {
          "Authorization": "Bearer $token", // إضافة Bearer قبل التوكن
          "Content-Type": "application/json",
          "token": token
        },
      ),
    );

    if (response.statusCode == 200) {
      return AddToCartResponse.fromJson(response.data); // تحويل البيانات إلى AddToCartResponse
    } else {
      throw Exception('Failed to add product to cart');
    }
  } on DioException catch (e) {
    print('Error during adding to cart: ${e.response?.data}');
    rethrow;
  }
}
Future<CartResponseModel> getCart() async {
  try {
    final token = await getToken();  // استرجاع التوكن
    final response = await _dio.get(
      '$_baseUrl/cart',
      options: Options(
        headers: {
          "token": token
        },
      ),
    );

    if (response.statusCode == 200) {
       return CartResponseModel.fromJson(response.data); // 
    } else {
      throw Exception('Failed to add product to cart');
    }
  } on DioException catch (e) {
    print('Error during adding to cart: ${e.response?.data}');
    rethrow;
  }
}
}
 