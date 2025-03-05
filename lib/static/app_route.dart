import 'package:go_router/go_router.dart';
import 'package:story_app1/ui/pages/home/home_page.dart';
import 'package:story_app1/ui/pages/login/login_page.dart';
import 'package:story_app1/ui/pages/post/create_post_page.dart';
import 'package:story_app1/ui/pages/register/register_page.dart';
import 'package:story_app1/services/sesion_manager.dart';

final SesionManager _sessionManager = SesionManager();

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
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
      routes: <RouteBase>[
        GoRoute(path: 'post', builder: (context, state) => CreatePostPage()),
      ],
    ),
  ],
  redirect: (context, state) async {
    final isLoggedIn = await _sessionManager.isLoggedIn();

    if (!isLoggedIn && state.uri.toString() != '/login') {
      return '/login';
    }
    // Jika pengguna sudah login dan mencoba mengakses halaman login
    if (isLoggedIn && state.uri.toString() == '/login') {
      return '/home';
    }

    return null;
  },
);
