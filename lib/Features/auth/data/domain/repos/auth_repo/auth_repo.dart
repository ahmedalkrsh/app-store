import 'package:dartz/dartz.dart';
import 'package:mystore/Features/auth/data/models/sign.up.model.dart';
import 'package:mystore/Features/auth/data/models/signin_model.dart';

import 'package:mystore/core/api_services.dart';
import 'package:mystore/core/errors/failures.dart';

class AuthRepo {
  final ApiService apiService;

  AuthRepo(this.apiService);

  Future<Either<Failure, UserResponse>> createUser({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    try {
      User userData = User(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );

      var response =
          await apiService.registerUser(userData, endpoint: '/auth/signup');

      if (response != null) {
        return Right(UserResponse.fromJson(response));
      } else {
        return Left(
            Serverfailure(response['message'] ?? 'Unknown error occurred'));
      }
    } catch (e) {
      return Left(Serverfailure(e.toString()));
    }
  }

  Future<Either<Failure, UserResponse>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      LoginUser signinDatta = LoginUser(
        email: email,
        password: password,
      );

      var response = await apiService.loginUser(
        signinDatta,
        endpoint: '/auth/signin',
      );

      if (response != null) {
        return Right(UserResponse.fromJson(response));
      } else {
        return Left(
            Serverfailure(response['message'] ?? 'Unknown error occurred'));
      }
    } catch (e) {
      return Left(Serverfailure(e.toString()));
    }
  }
}
