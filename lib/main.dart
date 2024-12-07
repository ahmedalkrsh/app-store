import 'package:flutter/material.dart';
import 'package:mystore/Features/auth/presentation/views/login_view.dart';
import 'package:mystore/core/get_it-service.dart';
import 'package:mystore/core/helper_functions/on_generate_route.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  setup();
 runApp(
    const MyApp(),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: OnGenrateRoute.generateRoute,
      initialRoute: LoginView.routeName,
    );
  }
}
