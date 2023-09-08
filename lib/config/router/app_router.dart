import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    name: HomeScreen.pathName,
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      name: ButtonsScreen.pathName,
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen()),
  GoRoute(
      name: CardsScreen.pathName,
      path: '/cards',
      builder: (context, state) => const CardsScreen())
]);
