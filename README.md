# Imerso — Language Learning App

## Overview

Imerso is a mobile app that teaches languages through short-form immersive video content. Users watch real videos with synchronized subtitles, tap any word to see its meaning and save it to their vocabulary, and track their progress across a personalized dashboard. The app supports Japanese, Spanish, and Korean out of the box.

## Features

**Stage 1 — Foundation & Onboarding**
- Splash screen with initialization logic and SharedPreferences routing
- Welcome screen with animated gradient hero
- Language selection (Japanese, Spanish, Korean) with flag cards
- Proficiency level picker (A1–C1) with animated star selector
- Onboarding state persisted via SharedPreferences

**Stage 2 — Home Feed**
- Vertical TikTok-style video feed with PageView
- Mock feed items with poster images via CachedNetworkImage
- Shimmer loading placeholders
- Right-side action column: Like, Save, Share, Comment buttons with counts
- Language badge overlay on each video card

**Stage 3 — Word Bottom Sheet**
- Tap any subtitle word to open a bottom sheet with meaning and example
- Save word to vocabulary with haptic feedback and snack bar confirmation
- Real-time saved state reflected across vocabulary and home screens
- Language auto-detection from Unicode character ranges

**Stage 4 — Vocabulary**
- Full saved-word list with search bar and filter chips (language + part of speech)
- Swipe-to-dismiss with confirmation dialog
- Long-press context menu: toggle mastered / remove
- Sort by saved date, alphabetical, review count, or mastered status
- Word detail screen with slide-up transition: meaning, example, notes, related words
- Stats row: total saved, mastered count, added this week

**Stage 5 — Progress Dashboard**
- Weekly bar chart (fl_chart): today's bar highlighted in accent/primary gradient
- 30-day trend line chart with gradient fill below the curve
- Language breakdown donut pie chart with legend
- 28-day activity heatmap calendar with 4 intensity levels
- Level progress bar with 1 200 ms animated fill (flutter_animate)
- Stats grid: total immersion time, streak, words learned, videos watched

**Stage 6 — Profile & Settings**
- Profile screen with collapsing avatar header, gradient ring, edit button
- Stats row: videos watched, words learned, current streak
- Currently Learning card reusing the level progress bar
- Achievements horizontal scroll with earned (gradient) / locked (greyed + lock) states
- Saved Videos 2×2 grid with portrait thumbnails
- Settings screen with slide-from-right transition
- Persisted settings via SharedPreferences: daily goal, notifications, difficulty, text size
- Daily goal bottom sheet (15/30/45/60 min) and text size bottom sheet
- Reset progress and reset onboarding dialogs in a red-bordered Danger Zone section
- NavigationBar wrapped in SafeArea for devices with home indicators

## Tech Stack

| Package | Version | Purpose |
|---|---|---|
| `flutter` | 3.x | UI framework |
| `go_router` | ^14.2.0 | Declarative routing with StatefulShellRoute |
| `flutter_riverpod` | ^2.6.1 | State management |
| `riverpod_annotation` | ^2.3.5 | Code-gen annotations for @riverpod |
| `riverpod_generator` | ^2.4.0 | Build-runner code generation |
| `freezed` | ^2.5.2 | Immutable data classes with code gen |
| `freezed_annotation` | ^2.4.1 | @freezed annotation |
| `shared_preferences` | ^2.3.1 | Persisted settings and onboarding state |
| `cached_network_image` | ^3.3.1 | Network images with shimmer placeholders |
| `fl_chart` | ^0.65.0 | Bar, line, and pie charts |
| `flutter_animate` | ^4.5.0 | Level progress bar fill animation |
| `google_fonts` | ^6.2.1 | Poppins (headings) + Inter (body) |
| `shimmer` | ^3.0.0 | Loading skeleton animation |
| `build_runner` | ^2.4.13 | Code generation runner |

## Project Structure

```
lib/
├── core/
│   ├── constants/        app_colors, app_spacing, app_strings, app_text_styles
│   ├── router/           app_router (GoRouter + AppRoutes)
│   └── widgets/          app_badge, app_button, app_empty_state, app_shimmer
├── data/
│   ├── mock/             mock_profile, mock_progress, mock_vocab_words, mock_vocabulary
│   └── models/           feed_item, profile_model, progress_model, vocabulary_model
└── features/
    ├── home/             feed screen, shell (bottom nav), video_feed_card, word_bottom_sheet
    ├── onboarding/       splash, welcome, language selection, proficiency level
    ├── profile/          profile screen, achievement_card, saved_thumbnail_card
    ├── progress/         progress screen, 6 chart/stat widgets
    ├── settings/         settings screen, settings_tile, settings_section
    └── vocabulary/       vocabulary screen, word detail screen, 3 word widgets
```

## Getting Started

```bash
git clone <repo-url>
cd "imerso mvp"
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## Architecture

Imerso uses a feature-first clean architecture: each feature owns its screens, widgets, and providers. State is managed with Riverpod 2.x using `@riverpod`-annotated providers generated by `riverpod_generator`. Data models are immutable `@freezed` classes. Navigation uses GoRouter with a `StatefulShellRoute.indexedStack` for the bottom nav shell and push routes for detail screens. All data is mock-only in this MVP — no network calls or databases are wired up.
