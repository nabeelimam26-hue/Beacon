import 'package:flutter/material.dart';
import '../models/conversation.dart';
import '../routing/beacon_routes.dart';
import '../shell/responsive_shell.dart';
class HomeScreen extends StatefulWidget { const HomeScreen({super.key}); @override State<HomeScreen> createState() => _HomeScreenState(); }
class _HomeScreenState extends State<HomeScreen> { String _selectedId = sampleConversations.first.id; @override Widget build(BuildContext context) => ResponsiveShell(conversations: sampleConversations, selectedId: _selectedId, onDesktopSelected: (conversation) => setState(() => _selectedId = conversation.id), onMobileSelected: (conversation) => Navigator.of(context).pushNamed(BeaconRoutes.chat, arguments: conversation.id), onAccount: () => Navigator.of(context).pushNamed(BeaconRoutes.account)); }