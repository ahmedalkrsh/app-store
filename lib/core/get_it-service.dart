import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mystore/Features/auth/data/domain/repos/auth_repo/auth_repo.dart';
import 'package:mystore/Features/auth/presentation/cupits/login_cupit/login_cubit.dart';
import 'package:mystore/Features/auth/presentation/cupits/register_cupit/regster_cubit.dart';
import 'package:mystore/Features/cart/data/repo/cart_repo.dart';
import 'package:mystore/Features/cart/presentation/myCartCupit/cubit/add_to_cart/my_cart_cubit.dart';
import 'package:mystore/Features/cart/presentation/myCartCupit/cubit/get_cart_cupit/get_cart_cubit.dart';
import 'package:mystore/Features/home/data/repos/get_product_repo.dart';
import 'package:mystore/Features/home/presentation/cupit/get_prduct_cubit.dart';
import 'package:mystore/core/api_services.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerLazySingleton<CartRepository>(() => CartRepository(getIt()));
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepository(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<MyCartCubit>(() => MyCartCubit(getIt()));
  getIt.registerFactory<GetCartCubit>(() => GetCartCubit(getIt()));
  getIt.registerFactory<GetPrductCubit>(() => GetPrductCubit(getIt()));

  getIt.registerFactory<RegsterCubit>(() => RegsterCubit(authRepo: getIt()));
}
