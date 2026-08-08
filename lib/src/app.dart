import 'package:flutter/material.dart';

import 'design/beacon_theme.dart';
import 'routing/beacon_routes.dart';

class BeaconApp extends StatelessWidget {
  const BeaconApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beacon',
      debugShowCheckedModeBanner: false,
      theme: BeaconTheme.light(),
      darkTheme: BeaconTheme.dark(),
      initialRoute: BeaconRoutes.splash,
      onGenerateRoute: BeaconRouter.onGenerateRoute,
    );
  }
}
