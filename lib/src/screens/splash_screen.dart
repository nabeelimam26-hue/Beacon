import 'package:flutter/material.dart';
import '../design/beacon_tokens.dart';
import '../widgets/beacon_logo.dart';
/// Auth routing is driven by the first Supabase auth-state emission in BeaconApp.
class SplashScreen extends StatelessWidget { const SplashScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [const BeaconLogo(), const SizedBox(height: BeaconSpacing.x4), Text('A calmer place for study conversations.', style: Theme.of(context).textTheme.bodySmall)]))); }