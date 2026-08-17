import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_models.dart';
import 'auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => SupabaseAuthRepository(Supabase.instance.client));

/// Resolves only after Supabase emits its initial local-session event.
final authStateProvider = StreamProvider<BeaconAuthState>((ref) async* {
  final repository = ref.watch(authRepositoryProvider);
  try {
    await for (final session in repository.authStateChanges) {
      yield session != null && session.isValid ? Authenticated(session.user) : const Unauthenticated();
    }
  } catch (_) { yield const AuthFailure('We could not restore your session. Please sign in again.'); }
});

String friendlyAuthError(Object error) {
  final message = error is AuthException ? error.message.toLowerCase() : error.toString().toLowerCase();
  if (message.contains('invalid login credentials') || message.contains('invalid credentials')) return 'That email or password is incorrect.';
  if (message.contains('already registered') || message.contains('already been registered')) return 'An account already exists for that email.';
  if (message.contains('password') && (message.contains('weak') || message.contains('least'))) return 'Choose a password with at least 8 characters.';
  if (message.contains('socket') || message.contains('network') || message.contains('connection')) return 'Check your connection and try again.';
  return 'We could not complete that request. Please try again.';
}