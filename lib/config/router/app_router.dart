import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRputer = GoRouter(
  initialLocation: '/',
  routes: 
[
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (contex,state) => const HomeScreen()
  ),

  GoRoute(
    path: '/buttons',
    name: ButtonsScreen.name,
    builder: (contex,state) => const ButtonsScreen()
  ),

  GoRoute(
    path: '/cards',
    name: CardsScreen.name,
    builder: (contex,state) => const CardsScreen()
  ),

  GoRoute(
    path: '/progress',
    name: ProgressScreen.name,
    builder: (contex,state) => const ProgressScreen()
  ),

  GoRoute(
    path: '/snackbars',
    name: SnackbarScreen.name,
    builder: (contex,state) => const SnackbarScreen()
  ),

  GoRoute(
    path: '/animated',
    name: AnimatedScreen.name,
    builder: (contex,state) => const AnimatedScreen()
  ),

  GoRoute(
    path: '/ui-controls',
    name: UiControlsScreen.name,
    builder: (contex,state) => const UiControlsScreen()
  ),

  GoRoute(
    path: '/tutorial',
    name: AppTutorial.name,
    builder: (contex,state) => const AppTutorial()
  ),


]);