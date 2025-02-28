import 'package:go_router/go_router.dart';
import 'package:story_app1/features/authentication/presentation/pages/login/login_page.dart';
import 'package:story_app1/features/authentication/presentation/pages/register/register_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
      routes: <RouteBase>[
        GoRoute(path: 'register', builder: (context, state) => RegisterPage()),
      ],
    ),
  ],
);
