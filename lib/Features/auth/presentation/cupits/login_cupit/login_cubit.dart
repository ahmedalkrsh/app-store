import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/Features/auth/data/domain/repos/auth_repo/auth_repo.dart';
import 'package:mystore/Features/auth/data/models/sign.up.model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());

    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.errroMessage)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}
