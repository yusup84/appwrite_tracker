import 'package:appwrite_tracker/auth_notifier/src/auth_notifier.dart';
import 'package:appwrite_tracker/auth_notifier/src/auth_state.dart';
import 'package:appwrite_tracker/dashboard/dashboard.dart';
import 'package:appwrite_tracker/features/login_screen/src/login_screen.dart';
import 'package:appwrite_tracker/features/signup_screen/signup_screen.dart';
import 'package:appwrite_tracker/home_page/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final authNotifier = ref.watch(authProvider.notifier);
  return GoRouter(
      initialLocation: '/dashboard',
      routes: [
        GoRoute(
            name: HomePage.name,
            path: "/",
            builder: (_, __) => const HomePage()),
        GoRoute(
            name: Dashboard.name,
            path: "/dashboard",
            builder: (_, __) => const Dashboard()),
        GoRoute(
            name: SignupScreen.name,
            path: "/signup",
            builder: (_, __) {
              // return SignupScreen(onSignup: (name, email, password) async {
              //   debugPrint('$name - $email - $password');
              //   final appWrite = GetIt.instance.get<Appwrite>();
              //   final user = await appWrite.createAccount(name, email, password);
              //   debugPrint(jsonEncode(user?.toMap() ?? '{}'));
              // });

              // diganti dengan fungsi notifier
              return SignupScreen(onSignup: (name, email, password) async {
                await authNotifier.signup(name, email, password);
              });
            }),
        GoRoute(
            name: LoginScreen.name,
            path: "/login",
            builder: (_, __) {
              return LoginScreen(onLogin: (email, password) async {
                // debugPrint('$email - $password');
                // final appWrite = GetIt.instance.get<Appwrite>();
                // final session = await appWrite.createEmailSession(email, password);
                // debugPrint(jsonEncode(session?.toMap() ?? '{}'));

                // diganti dengan fungsi notifier
                await authNotifier.login(email, password);
              });
            }),
      ],
      redirect: (context, state) {
        final location = state.matchedLocation;
        if (location == '/login' || location == '/signup') {
          if (authState.status == AuthStatus.authenticated) {
            return 'dashboard';
          }
        }
        if (location == '/dashboard' &&
            authState.status != AuthStatus.authenticated) {
          return '/';
        }
        return null;
      });
});
