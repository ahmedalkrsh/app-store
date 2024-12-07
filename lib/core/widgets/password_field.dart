import 'package:flutter/material.dart';
import 'package:mystore/core/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
    required this.hint,
    this.validator,
    this.onChanged, // إضافة onChanged
  });

  final void Function(String?)? onSaved;
  final void Function(String)? onChanged; // إضافة الخاصية
  final String hint;
  final String? Function(String?)? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obsecureText: obscureText,
      onSaved: widget.onSaved,
      hint: widget.hint,
      textInputType: TextInputType.visiblePassword,
      onChanged: widget.onChanged, // تمرير onChanged
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(Icons.visibility_off, color: Color(0XFFC9CECF))
            : const Icon(Icons.visibility, color: Color(0XFFC9CECF)),
      ),
      validator: widget.validator, // تمرير الـ validator هنا
    );
  }
}
