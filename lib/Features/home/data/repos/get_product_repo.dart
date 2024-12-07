import 'package:dartz/dartz.dart';
import 'package:mystore/Features/home/data/models/product_model.dart';
import 'package:mystore/core/api_services.dart';
import 'package:mystore/core/errors/failures.dart';



class ProductRepository {
  final ApiService apiService;

  ProductRepository(this.apiService);

  Future<Either<Failure, Product>> getProduct(String productId) async {
    try {
      final response = await apiService.getProduct(productId);
      return Right(Product.fromJson(response['data']));
    } catch (error) {
      return Left(Serverfailure(error.toString()));
    }
  }
}
