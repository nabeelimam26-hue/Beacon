import 'package:flutter/material.dart';

import '../design/beacon_tokens.dart';
import '../models/conversation.dart';
import '../widgets/empty_state.dart';

class ChatPane extends StatelessWidget {
  const ChatPane({super.key, this.conversationId, this.mobile = false});

  final String? conversationId;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final conversation = sampleConversations.where((item) => item.id == conversationId).firstOrNull;
    final palette = context.palette;
    return Scaffold(
      backgroundColor: palette.bgBase,
      appBar: AppBar(
        automaticallyImplyLeading: mobile,
        title: Text(conversation?.title ?? 'Select a conversation'),
        actions: [
          IconButton(tooltip: 'Search conversation', onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(tooltip: 'Conversation details', onPressed: () {}, icon: const Icon(Icons.info_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: conversation == null
                ? const BeaconEmptyState(icon: Icons.forum_outlined, message: 'Choose a conversation to begin')
                : ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(BeaconSpacing.x4),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return RepaintBoundary(child: _MessageBubble(message: message));
                    },
                  ),
          ),
          if (conversation != null) const _Composer(),
        ],
      ),
    );
  }
}

class _Composer extends StatelessWidget {
  const _Composer();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.all(BeaconSpacing.x4),
        decoration: BoxDecoration(color: palette.bgSurface, border: Border(top: BorderSide(color: palette.borderHairline))),
        child: Row(
          children: [
            IconButton(tooltip: 'Add attachment', onPressed: () {}, icon: const Icon(Icons.add)),
            const SizedBox(width: BeaconSpacing.x2),
            const Expanded(child: TextField(minLines: 1, maxLines: 5, decoration: InputDecoration(hintText: 'Write a message'))),
            const SizedBox(width: BeaconSpacing.x2),
            FilledButton(onPressed: () {}, child: const Icon(Icons.arrow_upward, semanticLabel: 'Send message')),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final _SeedMessage message;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final alignment = message.own ? Alignment.centerRight : Alignment.centerLeft;
    final radius = BorderRadius.only(
      topLeft: Radius.circular(message.own ? BeaconRadii.bubble : BeaconRadii.bubbleTail),
      topRight: Radius.circular(message.own ? BeaconRadii.bubbleTail : BeaconRadii.bubble),
      bottomLeft: const Radius.circular(BeaconRadii.bubble),
      bottomRight: const Radius.circular(BeaconRadii.bubble),
    );
    return Align(
      alignment: alignment,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 520),
        margin: const EdgeInsets.symmetric(vertical: BeaconSpacing.x2),
        padding: const EdgeInsets.all(BeaconSpacing.x3),
        decoration: BoxDecoration(
          color: message.own ? palette.accentSubtle : palette.bgSurface,
          borderRadius: radius,
          border: message.own ? null : Border.all(color: palette.borderHairline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!message.own) Text(message.sender, style: Theme.of(context).textTheme.bodyMedium),
            if (!message.own) const SizedBox(height: BeaconSpacing.x1),
            Text(message.text, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: BeaconSpacing.x2),
            Text(message.time, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}

class _SeedMessage {
  const _SeedMessage({required this.sender, required this.text, required this.time, this.own = false});

  final String sender;
  final String text;
  final String time;
  final bool own;
}

const _messages = <_SeedMessage>[
  _SeedMessage(sender: 'You', text: 'I will review it after lunch.', time: '09:45', own: true),
  _SeedMessage(sender: 'Maya', text: 'Updated notes are ready for review.', time: '09:42'),
  _SeedMessage(sender: 'You', text: 'Can you send the outline here?', time: '09:38', own: true),
];
