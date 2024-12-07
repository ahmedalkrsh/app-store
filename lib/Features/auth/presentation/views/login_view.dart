import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/Features/auth/presentation/cupits/login_cupit/login_cubit.dart';

import 'package:mystore/Features/auth/presentation/views/wedgets/login_view_boddy.dart';
import 'package:mystore/core/get_it-service.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
