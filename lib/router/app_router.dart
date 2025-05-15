import 'package:go_router/go_router.dart';
import 'package:todoqueueapp/ui/pages/dashboardpage.dart';
import 'package:todoqueueapp/ui/pages/loginpage.dart';
import 'package:todoqueueapp/ui/pages/task_creator_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => const TaskCreatorScreen(),
    ),
  ],
  initialLocation: '/login',
);
