import 'package:flutter/material.dart';

import '../design/beacon_tokens.dart';
import '../models/conversation.dart';
import 'empty_state.dart';

class ConversationListPane extends StatelessWidget {
  const ConversationListPane({super.key, required this.conversations, this.selectedId, required this.onSelected, this.showHeader = true});

  final List<Conversation> conversations;
  final String? selectedId;
  final ValueChanged<Conversation> onSelected;
  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      color: palette.bgSurface,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showHeader)
              Padding(
                padding: const EdgeInsets.fromLTRB(BeaconSpacing.x6, BeaconSpacing.x5, BeaconSpacing.x6, BeaconSpacing.x4),
                child: Row(
                  children: [
                    Expanded(child: Text('Conversations', style: Theme.of(context).textTheme.titleLarge)),
                    IconButton(
                      tooltip: 'New conversation',
                      onPressed: () {},
                      icon: const Icon(Icons.edit_square),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: BeaconSpacing.x4),
              child: TextField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search conversations'),
                textInputAction: TextInputAction.search,
              ),
            ),
            const SizedBox(height: BeaconSpacing.x3),
            Expanded(
              child: conversations.isEmpty
                  ? const BeaconEmptyState(icon: Icons.chat_bubble_outline, message: 'No conversations yet', actionLabel: 'Start a chat')
                  : ListView.builder(
                      itemCount: conversations.length,
                      itemBuilder: (context, index) {
                        final conversation = conversations[index];
                        return _ConversationTile(
                          conversation: conversation,
                          selected: conversation.id == selectedId,
                          onTap: () => onSelected(conversation),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConversationTile extends StatelessWidget {
  const _ConversationTile({required this.conversation, required this.selected, required this.onTap});

  final Conversation conversation;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: BeaconSpacing.x3, vertical: BeaconSpacing.x1),
      child: Material(
        color: selected ? palette.accentSubtle : Colors.transparent,
        borderRadius: BorderRadius.circular(BeaconRadii.md),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(BeaconRadii.md),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 64),
            child: Padding(
              padding: const EdgeInsets.all(BeaconSpacing.x3),
              child: Row(
                children: [
                  CircleAvatar(radius: 20, backgroundColor: palette.bgSunken, foregroundColor: palette.textSecondary, child: Icon(conversation.isGroup ? Icons.group_outlined : Icons.person_outline)),
                  const SizedBox(width: BeaconSpacing.x3),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(conversation.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: BeaconSpacing.x1),
                        Text(conversation.preview, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  const SizedBox(width: BeaconSpacing.x2),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(conversation.timestamp, style: Theme.of(context).textTheme.labelSmall),
                      if (conversation.unreadCount > 0) ...[
                        const SizedBox(height: BeaconSpacing.x2),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: BeaconSpacing.x2, vertical: BeaconSpacing.x1),
                          decoration: BoxDecoration(color: palette.accentDefault, borderRadius: BorderRadius.circular(BeaconRadii.sm)),
                          child: Text('${conversation.unreadCount}', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: BeaconPalette.light.textPrimary)),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
