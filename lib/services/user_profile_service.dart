// services/user_profile_service.dart

import '../models/user_profile.dart';

class UserProfileService {
  UserProfile getUserProfile() {
    return UserProfile(
      nickname: "Fal",
      title: "Jobless",
      joined: "2020",
      rating: 4.5,
      rarity: "Mythic",
    );
  }
}
