import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/Features/auth/presentation/cupits/login_cupit/login_cubit.dart';
import 'package:mystore/Features/auth/presentation/views/register_view.dart';
import 'package:mystore/Features/auth/presentation/views/wedgets/lgoin_fields.dart';
import 'package:mystore/Features/auth/presentation/views/wedgets/text_rich.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../home/presentation/views/product_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token); // حفظ التوكن باسم auth_token
}

  void _onLogin(BuildContext context, String? email, String? password) {
    if (email != null && password != null) {
      context.read<LoginCubit>().loginUser(email: email, password: password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is LoginSuccess) {
          saveToken(state.user.token);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Login Successful')));
          Navigator.pushReplacementNamed(context, ProductView.routeName);
        }
      },
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message,
                      size: 60, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 50),
                  Text(
                    'Welcome back, you have been missed!',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 25),
                  LoginFields(
                    formKey: _formKey,
                    onLogin: (email, password) =>
                        _onLogin(context, email, password),
                  ),
                  const SizedBox(height: 10),
                  if (state is LoginLoading) const CircularProgressIndicator(),
                  const SizedBox(height: 10),
                  TextRich(
                    firstText: 'Not a member?',
                    secondText: ' ',
                    linkText: 'Register now',
                    onLinkTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RegisterView.routeName);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
