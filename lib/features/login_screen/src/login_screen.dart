import 'package:appwrite_tracker/features/login_screen/src/login_form.dart';
import 'package:appwrite_tracker/features/login_screen/src/types.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   static const String name = 'login';
  final LoginCallback onLogin;
  const LoginScreen({super.key, required this.onLogin});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          LoginForm(
            onPressedLogin: widget.onLogin,
            emailController: _emailController,
            passwordController: _passwordController,
          )
        ],
      ),
    );
  }
}
