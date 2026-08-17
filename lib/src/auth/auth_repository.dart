import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthUser;
import 'auth_models.dart';
import 'secure_session_storage.dart';

abstract interface class AuthRepository {
  Future<AuthSession?> signIn({required String email, required String password});
  Future<AuthSession?> signUp({required String email, required String password, required String displayName});
  Future<void> signOut();
  AuthSession? get currentSession;
  Stream<AuthSession?> get authStateChanges;
}

class SupabaseAuthRepository implements AuthRepository {
  SupabaseAuthRepository(this._client, {this.storage});
  final SupabaseClient _client;
  final SecureSessionStorage? storage;
  @override
  AuthSession? get currentSession => _toSession(_client.auth.currentSession);
  @override
  Stream<AuthSession?> get authStateChanges => _client.auth.onAuthStateChange.map((change) => _toSession(change.session));
  @override
  Future<AuthSession?> signIn({required String email, required String password}) async => _toSession((await _client.auth.signInWithPassword(email: email, password: password)).session);
  @override
  Future<AuthSession?> signUp({required String email, required String password, required String displayName}) async => _toSession((await _client.auth.signUp(email: email, password: password, data: <String, dynamic>{'display_name': displayName})).session);
  @override
  Future<void> signOut() async { await _client.auth.signOut(); await storage?.clear(); }
  AuthSession? _toSession(Session? session) {
    if (session == null || session.isExpired) return null;
    return AuthSession(user: AuthUser(id: session.user.id, email: session.user.email, displayName: session.user.userMetadata?['display_name'] as String?), expiresAt: session.expiresAt == null ? null : DateTime.fromMillisecondsSinceEpoch(session.expiresAt! * 1000));
  }
}

/// Deterministic in-memory implementation for widget and unit tests.
class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({AuthSession? initialSession, this.invalidCredentials = false, this.emailAlreadyRegistered = false}) : _currentSession = initialSession;
  final bool invalidCredentials;
  final bool emailAlreadyRegistered;
  final StreamController<AuthSession?> _changes = StreamController<AuthSession?>.broadcast();
  AuthSession? _currentSession;
  bool sessionCleared = false;
  @override
  AuthSession? get currentSession => _currentSession?.isValid == true ? _currentSession : null;
  @override
  Stream<AuthSession?> get authStateChanges async* { yield currentSession; yield* _changes.stream; }
  @override
  Future<AuthSession?> signIn({required String email, required String password}) async { if (invalidCredentials) throw const AuthException('Invalid login credentials'); return _authenticate(email); }
  @override
  Future<AuthSession?> signUp({required String email, required String password, required String displayName}) async { if (emailAlreadyRegistered) throw const AuthException('User already registered'); return _authenticate(email, displayName: displayName); }
  @override
  Future<void> signOut() async { _currentSession = null; sessionCleared = true; _changes.add(null); }
  Future<AuthSession?> _authenticate(String email, {String? displayName}) async { _currentSession = AuthSession(user: AuthUser(id: 'test-user', email: email, displayName: displayName), expiresAt: DateTime.now().add(const Duration(hours: 1))); _changes.add(_currentSession); return _currentSession; }
  Future<void> dispose() => _changes.close();
}