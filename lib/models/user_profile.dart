// models/user_profile.dart

class UserProfile {
  final String nickname;
  final String title;
  final String joined;
  final double rating;
  final String rarity;

  UserProfile({
    required this.nickname,
    required this.title,
    required this.joined,
    required this.rating,
    required this.rarity,
  });
}
