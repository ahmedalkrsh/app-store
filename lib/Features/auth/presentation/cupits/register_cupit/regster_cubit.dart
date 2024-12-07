import 'package:bloc/bloc.dart';
import 'package:mystore/Features/auth/data/domain/repos/auth_repo/auth_repo.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';
import 'package:mystore/Features/auth/data/models/sign.up.model.dart';

part 'regster_state.dart';

class RegsterCubit extends Cubit<RegsterState> {
  final AuthRepo authRepo;
  final Logger _logger = Logger(); // Logger instance

  RegsterCubit({required this.authRepo}) : super(RegsterInitial());

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String rePassword,
    required String phone,
  }) async {
    _logger.i("Starting registration with email: $email");

    emit(RegsterLoading());

    final result = await authRepo.createUser(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );

    result.fold(
      (failure) {
        _logger.e("Registration failed: ${failure.errroMessage}");
        emit(RegsterFailure(message: failure.errroMessage));
      },
      (user) {
        _logger.i("Registration successful for user: ${user.name}");
        emit(RegsterSuccess(user));
      },
    );
  }
}
