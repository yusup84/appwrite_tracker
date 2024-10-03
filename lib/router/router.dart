import 'dart:convert';

import 'package:appwrite_tracker/appwrite/appwrite.dart';
import 'package:appwrite_tracker/features/signup_screen/signup_screen.dart';
import 'package:appwrite_tracker/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
        name: HomePage.name, path: "/", builder: (_, __) => const HomePage()),
    GoRoute(
        name: SignupScreen.name,
        path: "/signup",
        builder: (_, __) {
          return SignupScreen(onSignup: (name, email, password) async {
            debugPrint('$name - $email - $password');
            final appWrite = GetIt.instance.get<Appwrite>();
            final user = await appWrite.createAccount(name, email, password);
            debugPrint(jsonEncode(user ?? '{}'));
          });
        }),
  ]);
});
