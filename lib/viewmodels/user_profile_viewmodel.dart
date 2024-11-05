// viewmodels/user_profile_viewmodel.dart

import '../models/user_profile.dart';
import '../services/user_profile_service.dart';

class UserProfileViewModel {
  final UserProfileService _userProfileService = UserProfileService();
  late UserProfile userProfile;

  UserProfileViewModel() {
    userProfile = _userProfileService.getUserProfile();
  }
}
