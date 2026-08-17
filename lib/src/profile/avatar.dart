import 'package:flutter/material.dart';
import '../design/beacon_tokens.dart';
import 'user_profile.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, required this.profile, this.size = 40});
  final UserProfile profile;
  final double size;
  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return CircleAvatar(radius: size / 2, backgroundColor: palette.accentSubtle, foregroundImage: profile.avatarUrl == null ? null : NetworkImage(profile.avatarUrl!), child: profile.avatarUrl == null ? Text(profile.initials, style: Theme.of(context).textTheme.bodyMedium) : null);
  }
}