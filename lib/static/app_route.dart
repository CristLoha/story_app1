import 'package:go_router/go_router.dart';
import 'package:story_app1/data/model/story_model.dart';
import 'package:story_app1/ui/pages/detail/detail_page.dart';
import 'package:story_app1/ui/pages/home/home_page.dart';
import 'package:story_app1/ui/pages/login/login_page.dart';
import 'package:story_app1/ui/pages/createpost/upload_post_page.dart';
import 'package:story_app1/ui/pages/register/register_page.dart';
import 'package:story_app1/services/sesion_manager.dart';

final SessionManager _sessionManager = SessionManager();
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
        GoRoute(path: 'post', builder: (context, state) => UploadPostPage()),
        GoRoute(
          path: 'detail',
          builder: (context, state) {
            final story = state.extra as StoryModel;
            return StoryDetailPage(story: story);
          },
        ),
      ],
    ),
  ],
  redirect: (context, state) async {
    final isLoggedIn = await _sessionManager.isLoggedIn();

    if (!isLoggedIn && !state.uri.toString().startsWith('/login')) {
      return '/login';
    }

    if (isLoggedIn && state.uri.toString() == '/login') {
      return '/home';
    }

    return null;
  },
);
