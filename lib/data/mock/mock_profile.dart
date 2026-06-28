import '../models/profile_model.dart';

final UserProfile mockUserProfile = UserProfile(
  id: 'user_001',
  displayName: 'Alex Rivera',
  handle: '@alexrivera',
  avatarUrl: 'https://i.pravatar.cc/200?img=3',
  nativeLanguage: 'English',
  targetLanguage: 'Japanese',
  currentLevel: 'B1',
  levelProgressPercent: 0.64,
  totalVideosWatched: 183,
  totalWordsLearned: 247,
  currentStreakDays: 7,
  achievements: [
    Achievement(
      id: 'first_watch',
      emoji: '🎬',
      name: 'First Watch',
      description: 'Watched your first video',
      isEarned: true,
      earnedAt: DateTime(2026, 6, 27),
    ),
    Achievement(
      id: 'words_50',
      emoji: '📚',
      name: '50 Words',
      description: 'Saved 50 vocabulary words',
      isEarned: true,
      earnedAt: DateTime(2026, 6, 18),
    ),
    const Achievement(
      id: 'polyglot',
      emoji: '🌍',
      name: 'Polyglot',
      description: 'Learned words in 3 languages',
      isEarned: false,
    ),
    const Achievement(
      id: 'speed_learner',
      emoji: '⚡',
      name: 'Speed Learner',
      description: 'Learned 10 words in one day',
      isEarned: false,
    ),
  ],
  savedVideoThumbnails: const [
    'https://picsum.photos/200/350?random=20',
    'https://picsum.photos/200/350?random=21',
    'https://picsum.photos/200/350?random=22',
    'https://picsum.photos/200/350?random=23',
  ],
);
