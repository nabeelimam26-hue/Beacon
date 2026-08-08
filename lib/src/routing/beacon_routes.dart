import 'package:flutter/material.dart';

import '../screens/auth_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

abstract final class BeaconRoutes {
  static const splash = '/';
  static const auth = '/auth';
  static const home = '/home';
  static const chat = '/chat';
}

class BeaconRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case BeaconRoutes.splash:
        page = const SplashScreen();
      case BeaconRoutes.auth:
        page = const AuthScreen();
      case BeaconRoutes.home:
        page = const HomeScreen();
      case BeaconRoutes.chat:
        page = ChatScreen(conversationId: settings.arguments as String?);
      default:
        page = const HomeScreen();
    }
    return PageRouteBuilder<void>(
      settings: settings,
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: (context, animation, _, child) {
        final reduceMotion = MediaQuery.disableAnimationsOf(context);
        if (reduceMotion) return child;
        final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(begin: const Offset(.03, 0), end: Offset.zero).animate(curved),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
