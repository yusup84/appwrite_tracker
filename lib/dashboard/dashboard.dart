import 'package:appwrite_tracker/auth_notifier/src/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Dashboard'),
              const SizedBox(
                height: 10.0,
              ),
              Consumer(builder: (context, ref, widget) {
                final authNotifier = ref.watch(authProvider.notifier);
                return ElevatedButton(
                    onPressed: () async{
                      await authNotifier.logout();
                    },
                    child: const Text("Logout"));
              })
            ],
          ),
        ),
      ),
    );
  }
}
