import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/app_badge.dart';
import '../../../data/models/feed_item.dart';
import '../providers/feed_provider.dart';
import 'word_bottom_sheet.dart';

class VideoFeedCard extends ConsumerStatefulWidget {
  const VideoFeedCard({super.key, required this.item});
  final FeedItem item;

  @override
  ConsumerState<VideoFeedCard> createState() => _VideoFeedCardState();
}

class _VideoFeedCardState extends ConsumerState<VideoFeedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _heartCtrl;
  late final Animation<double> _heartScale;
  late final Animation<double> _heartOpacity;

  bool _showTranslation = false;
  Offset _doubleTapOffset = Offset.zero;
  bool _heartVisible = false;

  @override
  void initState() {
    super.initState();
    _heartCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _heartScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.3), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.3), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 0.0), weight: 40),
    ]).animate(CurvedAnimation(parent: _heartCtrl, curve: Curves.easeInOut));
    _heartOpacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 30),
    ]).animate(_heartCtrl);
    _heartCtrl.addStatusListener((s) {
      if (s == AnimationStatus.completed && mounted) {
        setState(() => _heartVisible = false);
      }
    });
  }

  @override
  void dispose() {
    _heartCtrl.dispose();
    super.dispose();
  }

  void _onDoubleTap(TapDownDetails details) {
    setState(() {
      _doubleTapOffset = details.localPosition;
      _heartVisible = true;
    });
    _heartCtrl.forward(from: 0);
    // Read live state from the provider (widget.item may be one frame stale).
    final current = ref
        .read(feedNotifierProvider)
        .firstWhere((e) => e.id == widget.item.id, orElse: () => widget.item);
    if (!current.isLiked) {
      ref.read(feedNotifierProvider.notifier).toggleLike(widget.item.id);
    }
  }


  @override
  Widget build(BuildContext context) {
      final item = ref.watch(feedNotifierProvider
        .select((list) => list.firstWhere((e) => e.id == widget.item.id,
            orElse: () => widget.item)));

    return GestureDetector(
      onDoubleTapDown: _onDoubleTap,
      onDoubleTap: () {}, // required for onDoubleTapDown to fire
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ── Layer 1: thumbnail ───────────────────────────────────────────
          _Thumbnail(url: item.thumbnailUrl),

          // ── Layer 2: gradient overlay ────────────────────────────────────
          const _GradientOverlay(),

          // ── Layer 3: right-side actions ──────────────────────────────────
          RepaintBoundary(child: _ActionBar(item: item)),

          // ── Layer 4: bottom content ──────────────────────────────────────
          _BottomContent(item: item),

          // ── Layer 5: subtitle overlay ────────────────────────────────────
          if (item.subtitleSegments.isNotEmpty)
            _SubtitleOverlay(
              segment: item.subtitleSegments.first,
              showTranslation: _showTranslation,
              onToggle: () =>
                  setState(() => _showTranslation = !_showTranslation),
            ),

          // ── Layer 6: double-tap heart ────────────────────────────────────
          if (_heartVisible)
            Positioned(
              left: _doubleTapOffset.dx - 40,
              top: _doubleTapOffset.dy - 40,
              child: IgnorePointer(
                child: AnimatedBuilder(
                  animation: _heartCtrl,
                  builder: (_, __) => Opacity(
                    opacity: _heartOpacity.value,
                    child: Transform.scale(
                      scale: _heartScale.value,
                      child: const Icon(
                        Icons.favorite_rounded,
                        size: 80,
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Thumbnail ─────────────────────────────────────────────────────────────────

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      memCacheWidth: 400,
      memCacheHeight: 700,
      placeholder: (_, __) => Container(color: AppColors.card),
      errorWidget: (_, __, ___) => Container(
        color: AppColors.card,
        child: const Icon(Icons.image_not_supported_outlined,
            color: AppColors.onSurfaceMuted),
      ),
    );
  }
}

// ── Gradient overlay ──────────────────────────────────────────────────────────

class _GradientOverlay extends StatelessWidget {
  const _GradientOverlay();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Color(0xCC000000)],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

// ── Right action bar ──────────────────────────────────────────────────────────

class _ActionBar extends ConsumerWidget {
  const _ActionBar({required this.item});
  final FeedItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(feedNotifierProvider.notifier);
    return Positioned(
      right: 12,
      bottom: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar + follow
          _AvatarButton(avatarUrl: item.creatorAvatarUrl),
          const SizedBox(height: AppSpacing.lg),
          // Like
          _ActionButton(
            icon: item.isLiked
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            label: _formatCount(item.likesCount),
            color: item.isLiked ? AppColors.accent : Colors.white,
            onTap: () => notifier.toggleLike(item.id),
          ),
          const SizedBox(height: AppSpacing.md),
          // Comment
          _ActionButton(
            icon: Icons.chat_bubble_outline_rounded,
            label: _formatCount(item.commentsCount),
            onTap: () {}, // TODO: open comments sheet
          ),
          const SizedBox(height: AppSpacing.md),
          // Share
          _ActionButton(
            icon: Icons.reply_rounded,
            label: 'Share',
            flipX: true,
            onTap: () {}, // TODO: share
          ),
          const SizedBox(height: AppSpacing.md),
          // Save
          _ActionButton(
            icon: item.isSaved
                ? Icons.bookmark_rounded
                : Icons.bookmark_border_rounded,
            label: 'Save',
            color: item.isSaved ? AppColors.primary : Colors.white,
            onTap: () => notifier.toggleSave(item.id),
          ),
        ],
      ),
    );
  }

  String _formatCount(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return n.toString();
  }
}

class _AvatarButton extends StatelessWidget {
  const _AvatarButton({required this.avatarUrl});
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: CachedNetworkImageProvider(avatarUrl, maxWidth: 88),
          backgroundColor: AppColors.card,
        ),
        Positioned(
          bottom: -8,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 14),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    this.color = Colors.white,
    this.flipX = false,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final bool flipX;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: flipX
                  ? (Matrix4.diagonal3Values(-1, 1, 1))
                  : Matrix4.identity(),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 2),
            Text(label,
                style: AppTextStyles.caption
                    .copyWith(color: Colors.white, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

// ── Bottom content ────────────────────────────────────────────────────────────

class _BottomContent extends StatelessWidget {
  const _BottomContent({required this.item});
  final FeedItem item;

  String _langFlag(String lang) => switch (lang) {
        'Japanese' => '🇯🇵',
        'Spanish' => '🇪🇸',
        'Korean' => '🇰🇷',
        'French' => '🇫🇷',
        'German' => '🇩🇪',
        _ => '🌐',
      };

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: AppSpacing.md,
      right: 80, // leave room for action bar
      bottom: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Creator handle
          Text('@${item.creatorHandle.replaceFirst('@', '')}',
              style: AppTextStyles.labelMedium
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
          const SizedBox(height: AppSpacing.xs),
          // Title
          Text(
            item.videoTitle,
            style: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.sm),
          // Tags
          if (item.tags.isNotEmpty)
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: item.tags
                  .take(3)
                  .map((t) => _TagChip(tag: t))
                  .toList(),
            ),
          const SizedBox(height: AppSpacing.sm),
          // Language + level badges
          Row(
            children: [
              AppBadge(
                label: '${_langFlag(item.targetLanguage)} ${item.targetLanguage}',
                color: AppColors.secondary,
              ),
              const SizedBox(width: AppSpacing.sm),
              AppBadge(
                label: item.difficultyLevel,
                color: AppColors.primaryLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
      ),
      child: Text('#$tag',
          style: AppTextStyles.caption.copyWith(color: Colors.white)),
    );
  }
}

// ── Subtitle overlay ──────────────────────────────────────────────────────────

class _SubtitleOverlay extends StatelessWidget {
  const _SubtitleOverlay({
    required this.segment,
    required this.showTranslation,
    required this.onToggle,
  });

  final SubtitleSegment segment;
  final bool showTranslation;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: AppSpacing.md,
      right: AppSpacing.md,
      bottom: 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.60),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, anim) =>
                        FadeTransition(opacity: anim, child: child),
                    child: showTranslation
                        ? Text(
                            key: const ValueKey('translation'),
                            segment.translationText,
                            style: AppTextStyles.bodyMedium
                                .copyWith(color: Colors.white),
                          )
                        : _HighlightedSubtitle(
                            key: const ValueKey('original'),
                            segment: segment,
                          ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                GestureDetector(
                  onTap: onToggle,
                  child: Icon(
                    showTranslation
                        ? Icons.translate_rounded
                        : Icons.translate_outlined,
                    color: showTranslation
                        ? AppColors.primaryLight
                        : Colors.white.withValues(alpha: 0.7),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HighlightedSubtitle extends StatelessWidget {
  const _HighlightedSubtitle({super.key, required this.segment});
  final SubtitleSegment segment;

  /// Splits [text] into alternating plain/highlighted spans by scanning for
  /// each word in [highlights] as a substring. Works for space-separated
  /// languages (Spanish) and non-space languages (Japanese, Korean).
  List<_SubtitleSpan> _buildSpans(String text, List<String> highlights) {
    if (highlights.isEmpty) return [_SubtitleSpan(text, null)];

    // Find the first highlighted word that appears in the text.
    String? found;
    int foundIndex = text.length;
    for (final w in highlights) {
      final idx = text.indexOf(w);
      if (idx != -1 && idx < foundIndex) {
        foundIndex = idx;
        found = w;
      }
    }

    if (found == null) return [_SubtitleSpan(text, null)];

    final before = text.substring(0, foundIndex);
    final after = text.substring(foundIndex + found.length);
    return [
      if (before.isNotEmpty) _SubtitleSpan(before, null),
      _SubtitleSpan(found, found),
      ..._buildSpans(after, highlights),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final spans = _buildSpans(segment.text, segment.highlightedWordIds);
    return RichText(
      text: TextSpan(
        children: spans.map((s) {
          final isHighlighted = s.wordKey != null;
          return WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: isHighlighted
                  ? () => showWordBottomSheet(context, s.wordKey!)
                  : null,
              child: Text(
                s.text,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.white,
                  decoration:
                      isHighlighted ? TextDecoration.underline : null,
                  decorationColor: AppColors.primaryLight,
                  decorationThickness: 2,
                  fontWeight:
                      isHighlighted ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _SubtitleSpan {
  const _SubtitleSpan(this.text, this.wordKey);
  final String text;
  final String? wordKey; // non-null = highlighted vocab word
}
