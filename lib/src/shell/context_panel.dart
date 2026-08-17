import 'package:flutter/material.dart';
import '../design/beacon_tokens.dart';
import '../widgets/empty_state.dart';
class ContextPanel extends StatelessWidget {
  const ContextPanel({super.key, this.onAccount}); final VoidCallback? onAccount;
  @override Widget build(BuildContext context) { final palette = context.palette; return Container(color: palette.bgSurface, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [Padding(padding: const EdgeInsets.all(BeaconSpacing.x6), child: Row(children: [const Text('Context'), const Spacer(), IconButton(tooltip: 'Account', onPressed: onAccount, icon: const Icon(Icons.account_circle_outlined))])), const Expanded(child: BeaconEmptyState(icon: Icons.folder_outlined, message: 'No files shared here yet.'))])); }
}