import 'package:flutter/foundation.dart';

@immutable
class UserProfile {
  const UserProfile({required this.id, required this.displayName, this.avatarUrl});
  final String id;
  final String displayName;
  final String? avatarUrl;
  String get initials => displayName.trim().split(RegExp(r'\s+')).where((part) => part.isNotEmpty).take(2).map((part) => part[0]).join().toUpperCase();
  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(id: json['id'] as String, displayName: json['display_name'] as String, avatarUrl: json['avatar_url'] as String?);
}