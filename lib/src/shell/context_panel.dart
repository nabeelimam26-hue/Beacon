import 'package:flutter/material.dart';

import '../design/beacon_tokens.dart';
import '../widgets/empty_state.dart';

class ContextPanel extends StatelessWidget {
  const ContextPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      color: palette.bgSurface,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(BeaconSpacing.x6),
            child: Text('Context'),
          ),
          Expanded(child: BeaconEmptyState(icon: Icons.folder_outlined, message: 'No files shared here yet.')),
        ],
      ),
    );
  }
}
