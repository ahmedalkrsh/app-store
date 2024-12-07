import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String rePassword;

  const User({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.rePassword,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
      rePassword: json['rePassword'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'rePassword': rePassword,
    };
  }

  @override
  List<Object?> get props => [name, email, phone, password, rePassword];
}


class UserResponse extends Equatable {
  final String name;
  final String email;
  final String role;
  final String token; // إضافة متغير الـ token

  const UserResponse({
    required this.name,
    required this.email,
    required this.role,
    required this.token, // إضافة الـ token في الـ constructor
  });

  // تعديل الـ factory method لاستقبال الـ token
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      name: json['user']['name'],
      email: json['user']['email'],
      role: json['user']['role'],
      token: json['token'], // استلام الـ token
    );
  }

  @override
  List<Object?> get props => [name, email, role, token]; // إضافة الـ token
}
