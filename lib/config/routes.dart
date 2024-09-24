import 'package:flutter/material.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/profile_screen.dart';
import '../presentation/screens/settings_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _createRoute(HomeScreen());
      case '/profile':
        return _createRoute(ProfileScreen());
      case '/settings':
        return _createRoute(SettingsScreen());
      default:
        return _createRoute(HomeScreen());
    }
  }

  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Переход справа налево
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
