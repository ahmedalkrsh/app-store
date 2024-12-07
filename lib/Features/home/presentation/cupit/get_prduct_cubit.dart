import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart'; 
import 'package:mystore/Features/home/data/models/product_model.dart';
import 'package:mystore/core/errors/failures.dart';
import '../../data/repos/get_product_repo.dart';

part 'get_prduct_state.dart';

class GetPrductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  final Logger _logger = Logger(); 
  GetPrductCubit(this.productRepository) : super(ProductInitial());

 Future<void> fetchProduct(String productId) async {
  try {
    _logger.i("Fetching product with ID: $productId");
    emit(ProductLoading());

    final result = await productRepository.getProduct(productId);

    result.fold(
      (failure) {
        
        _logger.e("Failed to fetch product: ");
        emit(ProductError( failure: failure));
      },
      (product) {
        _logger.i("Successfully fetched product: ${product.title}");
        emit(ProductLoaded(product: product));
      },
    );
  } catch (e) {
    _logger.e("Unexpected error: $e");
    emit(ProductError(failure:Serverfailure( e.toString() )));
  }
}

}
