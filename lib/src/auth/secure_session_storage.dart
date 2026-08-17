import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Stores Supabase's serialized session in the platform's encrypted keystore.
class SecureSessionStorage extends LocalStorage {
  SecureSessionStorage({FlutterSecureStorage? storage}) : _storage = storage ?? const FlutterSecureStorage();
  static const _sessionKey = 'beacon.supabase.auth.session';
  final FlutterSecureStorage _storage;
  @override
  Future<void> initialize() async {}
  @override
  Future<bool> hasAccessToken() async => (await _storage.read(key: _sessionKey)) != null;
  @override
  Future<String?> accessToken() => _storage.read(key: _sessionKey);
  @override
  Future<void> persistSession(String value) => _storage.write(key: _sessionKey, value: value);
  @override
  Future<void> removePersistedSession() => _storage.delete(key: _sessionKey);
  Future<void> clear() => removePersistedSession();
}