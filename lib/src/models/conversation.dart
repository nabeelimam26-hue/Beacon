class Conversation {
  const Conversation({
    required this.id,
    required this.title,
    required this.preview,
    required this.timestamp,
    this.unreadCount = 0,
    this.isGroup = false,
  });

  final String id;
  final String title;
  final String preview;
  final String timestamp;
  final int unreadCount;
  final bool isGroup;
}

const sampleConversations = <Conversation>[
  Conversation(id: 'studio', title: 'Design Studio', preview: 'Maya: Updated notes are ready for review.', timestamp: '09:42', unreadCount: 2, isGroup: true),
  Conversation(id: 'alex', title: 'Alex Rivera', preview: 'Can we compare the draft before class?', timestamp: 'Yesterday'),
  Conversation(id: 'physics', title: 'Physics 204', preview: 'Lab partners meet at 3pm.', timestamp: 'Mon', isGroup: true),
];
