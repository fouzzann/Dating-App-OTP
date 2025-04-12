
class ChatUser {
  final String id;
  final String name;
  final String username;
  final String email;
  final String profilePhotoUrl;
  final bool isOnline;
  final String lastActiveAt;
  final int age;

  ChatUser({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.profilePhotoUrl,
    required this.isOnline,
    required this.lastActiveAt,
    required this.age,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['id'],
      name: json['attributes']['name'],
      username: json['attributes']['username'],
      email: json['attributes']['email'],
      profilePhotoUrl: json['attributes']['profile_photo_url'],
      isOnline: json['attributes']['is_online'] ?? false,
      lastActiveAt: json['attributes']['last_active_at'] ?? '',
      age: json['attributes']['age'] ?? 0,
    );
  }
}

