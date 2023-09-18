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
      builder: (context, state) => const CardsScreen()),
  GoRoute(
      name: AnimatedScreen.pathName,
      path: '/animated',
      builder: (context, state) => const AnimatedScreen()),
  GoRoute(
    name: AppTutorialScreen.pathName,
    path: '/app_tutorial',
    builder: (context, state) => const AppTutorialScreen(),
  ),
  GoRoute(
    name: InfiniteScrollScreen.pathName,
    path: '/infinite_scroll',
    builder: (context, state) => const InfiniteScrollScreen(),
  ),
  GoRoute(
    name: SnackbarScreen.pathName,
    path: '/snackbar',
    builder: (context, state) => const SnackbarScreen(),
  ),
  GoRoute(
    name: UiControlsScreen.pathName,
    path: '/ui_controls',
    builder: (context, state) => const UiControlsScreen(),
  ),
  GoRoute(
    name: ProgressScreen.pathName,
    path: '/progress',
    builder: (context, state) => const ProgressScreen(),
  )
]);
