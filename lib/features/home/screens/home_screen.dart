import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../providers/feed_provider.dart';
import '../widgets/video_feed_card.dart';

const _kLanguages = ['All', 'Japanese', 'Spanish', 'Korean'];

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final PageController _pageCtrl;
  bool _appending = false;

  @override
  void initState() {
    super.initState();
    _pageCtrl = PageController();
    _pageCtrl.addListener(_onScroll);
  }

  @override
  void dispose() {
    _pageCtrl.removeListener(_onScroll);
    _pageCtrl.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_appending || !_pageCtrl.hasClients) return;
    final feed = ref.read(filteredFeedProvider);
    final page = _pageCtrl.page ?? 0;
    if (page >= feed.length - 2) {
      _appending = true;
      ref.read(feedNotifierProvider.notifier).appendMore();
      // Reset flag after a frame so it only fires once per threshold crossing.
      WidgetsBinding.instance.addPostFrameCallback((_) => _appending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(filteredFeedProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // ── Feed ─────────────────────────────────────────────────────────
          feed.isEmpty
              ? const _EmptyFeed()
              : PageView.builder(
                  controller: _pageCtrl,
                  scrollDirection: Axis.vertical,
                  itemCount: feed.length,
                  itemBuilder: (_, index) =>
                      VideoFeedCard(key: ValueKey(feed[index].id), item: feed[index]),
                ),

          // ── Top overlay (app name + filter chips) ────────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _TopBar(),
          ),
        ],
      ),
    );
  }
}

// ── Top bar ───────────────────────────────────────────────────────────────────

class _TopBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(feedLanguageFilterProvider);
    final top = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.fromLTRB(
          AppSpacing.md, top + AppSpacing.sm, AppSpacing.sm, AppSpacing.sm),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0x99000000), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Text('Imerso',
              style: AppTextStyles.labelLarge
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
          const Spacer(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _kLanguages
                  .map((lang) => _FilterChip(
                        label: lang,
                        selected: lang == selected,
                        onTap: () => ref
                            .read(feedLanguageFilterProvider.notifier)
                            .set(lang),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(left: AppSpacing.xs),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm + 2, vertical: AppSpacing.xs),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary
              : Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: selected ? AppColors.primary : Colors.white.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: Colors.white,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// ── Empty state ───────────────────────────────────────────────────────────────

class _EmptyFeed extends StatelessWidget {
  const _EmptyFeed();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.movie_filter_outlined,
              color: AppColors.onSurfaceMuted, size: 48),
          SizedBox(height: AppSpacing.md),
          Text('No videos for this language yet',
              style: TextStyle(color: AppColors.onSurfaceMuted)),
        ],
      ),
    );
  }
}
