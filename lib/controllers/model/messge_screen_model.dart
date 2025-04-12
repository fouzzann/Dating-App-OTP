
class ChatMessage {
  final String id;
  final String message;
  final String senderId;
  final String receiverId;
  final DateTime sentAt;
  final DateTime? deliveredAt;
  final DateTime? viewedAt;
  final String? mediaUrl;

  ChatMessage({
    required this.id,
    required this.message,
    required this.senderId,
    required this.receiverId,
    required this.sentAt,
    this.deliveredAt,
    this.viewedAt,
    this.mediaUrl,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      message: json['attributes']['message'],
      senderId: json['attributes']['sender_id'].toString(),
      receiverId: json['attributes']['receiver_id'].toString(),
      sentAt: DateTime.parse(json['attributes']['sent_at']),
      deliveredAt:
          json['attributes']['delivered_at'] != null
              ? DateTime.parse(json['attributes']['delivered_at'])
              : null,
      viewedAt:
          json['attributes']['viewed_at'] != null
              ? DateTime.parse(json['attributes']['viewed_at'])
              : null,
      mediaUrl: json['attributes']['media_url'],
    );
  }
}