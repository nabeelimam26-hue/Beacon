import 'package:flutter/material.dart';

import '../design/beacon_tokens.dart';
import '../routing/beacon_routes.dart';
import '../widgets/beacon_logo.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              elevation: 0,
              color: palette.bgSurface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BeaconRadii.lg), side: BorderSide(color: palette.borderHairline)),
              child: Padding(
                padding: const EdgeInsets.all(BeaconSpacing.x8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const BeaconLogo(),
                    const SizedBox(height: BeaconSpacing.x8),
                    Text('Welcome to Beacon', style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: BeaconSpacing.x2),
                    Text('Sign-in wiring arrives in a later phase. This screen defines the approved structure only.', style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: BeaconSpacing.x6),
                    const TextField(decoration: InputDecoration(labelText: 'Email address')),
                    const SizedBox(height: BeaconSpacing.x3),
                    const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password')),
                    const SizedBox(height: BeaconSpacing.x5),
                    FilledButton(onPressed: () => Navigator.of(context).pushReplacementNamed(BeaconRoutes.home), child: const Text('Continue')),
                    const SizedBox(height: BeaconSpacing.x3),
                    TextButton(onPressed: () {}, child: const Text('Create an account')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
