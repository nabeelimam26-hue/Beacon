import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../auth/auth_models.dart';
import '../auth/auth_providers.dart';
import 'user_profile.dart';

abstract interface class ProfileRepository { Future<UserProfile> fetchCurrent(String userId); }
class SupabaseProfileRepository implements ProfileRepository {
  SupabaseProfileRepository(this._client);
  final SupabaseClient _client;
  @override
  Future<UserProfile> fetchCurrent(String userId) async => UserProfile.fromJson(await _client.from('profiles').select().eq('id', userId).single());
}
final profileRepositoryProvider = Provider<ProfileRepository>((ref) => SupabaseProfileRepository(Supabase.instance.client));
final currentProfileProvider = FutureProvider<UserProfile?>((ref) async {
  final auth = ref.watch(authStateProvider).valueOrNull;
  if (auth is! Authenticated) return null;
  return ref.watch(profileRepositoryProvider).fetchCurrent(auth.user.id);
});