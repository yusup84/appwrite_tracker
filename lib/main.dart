import 'package:appwrite_tracker/dependencies.dart';
import 'package:appwrite_tracker/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  initDependencies();
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final appwrite = GetIt.instance.get<Appwrite>();

    return Consumer(builder: (context, ref, child) {
      final router = ref.watch(routerProvider);
      return MaterialApp.router(
        routerConfig: router,
      );
    });
  }
}
