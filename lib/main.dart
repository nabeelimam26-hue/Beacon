import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'src/app.dart';
import 'src/auth/auth_providers.dart';
import 'src/auth/auth_repository.dart';
import 'src/auth/secure_session_storage.dart';
export 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const url = String.fromEnvironment('SUPABASE_URL');
  const key = String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY');
  if (url.isEmpty || key.isEmpty) throw StateError('Set SUPABASE_URL and SUPABASE_PUBLISHABLE_KEY with --dart-define-from-file=.env.');
  final secureStorage = SecureSessionStorage();
  await Supabase.initialize(url: url, publishableKey: key, authOptions: FlutterAuthClientOptions(localStorage: secureStorage));
  runApp(ProviderScope(overrides: [authRepositoryProvider.overrideWithValue(SupabaseAuthRepository(Supabase.instance.client, storage: secureStorage))], child: const BeaconApp()));
}