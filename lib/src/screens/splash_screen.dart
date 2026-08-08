import 'package:flutter/material.dart';

import '../design/beacon_tokens.dart';
import '../routing/beacon_routes.dart';
import '../widgets/beacon_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 700), () {
      if (mounted) Navigator.of(context).pushReplacementNamed(BeaconRoutes.auth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BeaconLogo(),
            const SizedBox(height: BeaconSpacing.x4),
            Text('A calmer place for study conversations.', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
