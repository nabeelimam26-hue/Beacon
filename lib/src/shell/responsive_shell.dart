import 'package:flutter/material.dart';

import '../design/beacon_tokens.dart';
import '../models/conversation.dart';
import '../widgets/conversation_list.dart';
import 'chat_pane.dart';
import 'context_panel.dart';

class ResponsiveShell extends StatelessWidget {
  const ResponsiveShell({super.key, required this.conversations, required this.selectedId, required this.onDesktopSelected, required this.onMobileSelected});

  static const double desktopBreakpoint = 720;

  final List<Conversation> conversations;
  final String selectedId;
  final ValueChanged<Conversation> onDesktopSelected;
  final ValueChanged<Conversation> onMobileSelected;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < desktopBreakpoint) {
          return Scaffold(
            appBar: AppBar(title: const Text('Beacon'), actions: [IconButton(tooltip: 'New conversation', onPressed: () {}, icon: const Icon(Icons.edit_square))]),
            body: ConversationListPane(conversations: conversations, selectedId: null, onSelected: onMobileSelected, showHeader: false),
          );
        }
        final showContext = constraints.maxWidth >= 960;
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 960, minHeight: 600),
                child: Row(
                  children: [
                    SizedBox(width: constraints.maxWidth >= 1180 ? 320 : 280, child: ConversationListPane(conversations: conversations, selectedId: selectedId, onSelected: onDesktopSelected)),
                    VerticalDivider(color: context.palette.borderHairline),
                    Expanded(child: ChatPane(conversationId: selectedId)),
                    if (showContext) ...[
                      VerticalDivider(color: context.palette.borderHairline),
                      const SizedBox(width: 280, child: ContextPanel()),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
