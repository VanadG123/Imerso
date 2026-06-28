import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/mock/mock_profile.dart';
import '../../../data/models/profile_model.dart';

part 'profile_provider.g.dart';

@riverpod
UserProfile userProfile(UserProfileRef ref) => mockUserProfile;
