import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth/auth_models.dart';
import 'auth/auth_providers.dart';
import 'design/beacon_theme.dart';
import 'routing/beacon_routes.dart';

class BeaconApp extends ConsumerStatefulWidget {
  const BeaconApp({super.key});
  @override
  ConsumerState<BeaconApp> createState() => _BeaconAppState();
}
class _BeaconAppState extends ConsumerState<BeaconApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  bool _receivedInitialState = false;
  Timer? _fallbackTimer;
  @override
  void initState() {
    super.initState();
    ref.listenManual(
      authStateProvider,
      (_, next) => next.whenData(_routeForAuthState),
      fireImmediately: true,
    );
    _fallbackTimer = Timer(const Duration(seconds: 3), () {
      if (!_receivedInitialState && mounted) _navigateTo(BeaconRoutes.auth);
    });
  }
  void _routeForAuthState(BeaconAuthState state) { _receivedInitialState = true; _fallbackTimer?.cancel(); final destination = BeaconRouter.destinationFor(state); if (destination != null) _navigateTo(destination); }
  @override
  void dispose() { _fallbackTimer?.cancel(); super.dispose(); }
  void _navigateTo(String destination) => WidgetsBinding.instance.addPostFrameCallback((_) { if (mounted) _navigatorKey.currentState?.pushNamedAndRemoveUntil(destination, (route) => false); });
  @override
  Widget build(BuildContext context) => MaterialApp(title: 'Beacon', navigatorKey: _navigatorKey, debugShowCheckedModeBanner: false, theme: BeaconTheme.light(), darkTheme: BeaconTheme.dark(), initialRoute: BeaconRoutes.splash, onGenerateRoute: BeaconRouter.onGenerateRoute);
}