import 'package:flutter/material.dart';

import '../shell/chat_pane.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, this.conversationId});

  final String? conversationId;

  @override
  Widget build(BuildContext context) {
    return ChatPane(conversationId: conversationId, mobile: true);
  }
}
