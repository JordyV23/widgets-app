import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRputer = GoRouter(
  initialLocation: '/',
  routes: 
[
  GoRoute(
    path: '/',
    builder: (contex,state) => const HomeScreen()
  ),

  GoRoute(
    path: '/buttons',
    builder: (contex,state) => const ButtonsScreen()
  ),

  GoRoute(
      path: '/cards',
      builder: (contex,state) => const CardsScreen()
  ),


]);