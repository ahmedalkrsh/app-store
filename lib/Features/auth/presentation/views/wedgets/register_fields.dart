import 'package:flutter/material.dart';
import 'package:mystore/Features/auth/presentation/views/wedgets/custom_button.dart';
import 'package:mystore/core/widgets/custom_text_field.dart';
import 'package:mystore/core/widgets/password_field.dart';

class RegisterFields extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String name, String email, String password, String rePassword,
      String phone) onRegister;

  const RegisterFields({
    super.key,
    required this.formKey,
    required this.onRegister,
  });

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: 'Full Name',
          onSaved: (value) => name = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your full name';
            }
            return null;
          },
          textInputType: TextInputType.name,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hint: 'Email',
          textInputType: TextInputType.emailAddress,
          onSaved: (value) => email = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email';
            } else if (!RegExp(
                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                .hasMatch(value)) {
              return 'Enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        PasswordField(
          hint: 'Password',
          onChanged: (value) =>
              password = value, // يتم حفظ كلمة المرور عند الكتابة
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        PasswordField(
          hint: 'Confirm Password',
          onSaved: (value) => rePassword = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != password) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hint: 'Phone',
          textInputType: TextInputType.phone,
          onSaved: (value) => phone = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();
              widget.onRegister(name!, email!, password!, rePassword!, phone!);
            }
          },
          text: 'Register',
        ),
      ],
    );
  }
}
