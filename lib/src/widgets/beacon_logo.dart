import 'package:flutter/material.dart';

import '../design/beacon_tokens.dart';
import '../design/beacon_theme.dart';

class BeaconLogo extends StatelessWidget {
  const BeaconLogo({super.key, this.showWordmark = true});

  final bool showWordmark;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: palette.accentSubtle,
            borderRadius: BorderRadius.circular(BeaconRadii.md),
            border: Border.all(color: palette.borderHairline),
          ),
          child: Icon(Icons.wb_twilight_outlined, color: palette.accentDefault, size: 20, semanticLabel: 'Beacon mark'),
        ),
        if (showWordmark) ...[
          const SizedBox(width: BeaconSpacing.x3),
          Text('Beacon', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: BeaconFonts.heading)),
        ],
      ],
    );
  }
}
