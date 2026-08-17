import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_models.dart';
import '../auth/auth_providers.dart';
import '../design/beacon_tokens.dart';
import '../profile/avatar.dart';
import '../profile/profile_repository.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider);
    final auth = ref.watch(authStateProvider).valueOrNull;
    return Scaffold(appBar: AppBar(title: const Text('Account')), body: Padding(padding: const EdgeInsets.all(BeaconSpacing.x6), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      profile.when(data: (value) => value == null ? const SizedBox.shrink() : Row(children: [ProfileAvatar(profile: value), const SizedBox(width: BeaconSpacing.x3), Expanded(child: Text(value.displayName, style: Theme.of(context).textTheme.titleMedium))]), loading: () => const SizedBox(height: 40, child: Center(child: CircularProgressIndicator())), error: (_, _) => Text(auth is Authenticated ? auth.user.email ?? 'Signed in' : 'Signed in')),
      const SizedBox(height: BeaconSpacing.x6),
      OutlinedButton.icon(onPressed: () => ref.read(authRepositoryProvider).signOut(), icon: const Icon(Icons.logout_outlined), label: const Text('Log out')),
    ])));
  }
}