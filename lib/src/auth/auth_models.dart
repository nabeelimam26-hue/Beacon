import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  const AuthUser({required this.id, required this.email, this.displayName});
  final String id;
  final String? email;
  final String? displayName;
}

@immutable
class AuthSession {
  const AuthSession({required this.user, this.expiresAt});
  final AuthUser user;
  final DateTime? expiresAt;
  bool get isValid => expiresAt == null || expiresAt!.isAfter(DateTime.now());
}

sealed class BeaconAuthState { const BeaconAuthState(); }
class AuthLoading extends BeaconAuthState { const AuthLoading(); }
class Authenticated extends BeaconAuthState { const Authenticated(this.user); final AuthUser user; }
class Unauthenticated extends BeaconAuthState { const Unauthenticated(); }
class AuthFailure extends BeaconAuthState { const AuthFailure(this.message); final String message; }