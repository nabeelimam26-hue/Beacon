import 'package:flutter/material.dart';

import '../design/beacon_tokens.dart';

class BeaconEmptyState extends StatelessWidget {
  const BeaconEmptyState({super.key, required this.icon, required this.message, this.actionLabel, this.onAction});

  final IconData icon;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(BeaconSpacing.x8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32, color: palette.textMuted),
            const SizedBox(height: BeaconSpacing.x4),
            Text(message, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
            if (actionLabel != null) ...[
              const SizedBox(height: BeaconSpacing.x6),
              FilledButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}
