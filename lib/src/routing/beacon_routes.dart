import 'package:flutter/material.dart';
import '../auth/auth_models.dart';
import '../screens/account_screen.dart';
import '../screens/auth_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

abstract final class BeaconRoutes {
  static const splash = '/';
  static const auth = '/auth';
  static const home = '/home';
  static const chat = '/chat';
  static const account = '/account';
}
class BeaconRouter {
  static String? destinationFor(BeaconAuthState state) => switch (state) { Authenticated() => BeaconRoutes.home, Unauthenticated() || AuthFailure() => BeaconRoutes.auth, AuthLoading() => null };
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) { BeaconRoutes.splash => const SplashScreen(), BeaconRoutes.auth => const AuthScreen(), BeaconRoutes.home => const HomeScreen(), BeaconRoutes.chat => ChatScreen(conversationId: settings.arguments as String?), BeaconRoutes.account => const AccountScreen(), _ => const HomeScreen() };
    return PageRouteBuilder<void>(settings: settings, pageBuilder: (_, _, _) => page, transitionsBuilder: (context, animation, _, child) { if (MediaQuery.disableAnimationsOf(context)) return child; final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic); return FadeTransition(opacity: curved, child: SlideTransition(position: Tween<Offset>(begin: const Offset(.03, 0), end: Offset.zero).animate(curved), child: child)); }, transitionDuration: const Duration(milliseconds: 300));
  }
}