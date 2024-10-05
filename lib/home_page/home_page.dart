import 'package:appwrite_tracker/features/login_screen/login_screen.dart';
import 'package:appwrite_tracker/features/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const String name = "home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Welcome to appwrite tracker"),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(LoginScreen.name);
                },
                child: const Text("Login")),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(SignupScreen.name);
                },
                child: const Text("Create account")),
          ],
        ),
      ),
    );
  }
}
