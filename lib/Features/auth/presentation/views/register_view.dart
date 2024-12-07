import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/Features/auth/presentation/cupits/register_cupit/regster_cubit.dart';

import 'package:mystore/Features/auth/presentation/views/wedgets/register_view_body.dart';
import 'package:mystore/core/get_it-service.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegsterCubit(authRepo: getIt()),
      child: const Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
