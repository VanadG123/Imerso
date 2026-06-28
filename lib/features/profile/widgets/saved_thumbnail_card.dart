import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_shimmer.dart';

class SavedThumbnailCard extends StatelessWidget {
  const SavedThumbnailCard({super.key, required this.thumbnailUrl});

  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: thumbnailUrl,
          fit: BoxFit.cover,
          memCacheWidth: 200,
          placeholder: (context, url) => const AppShimmer(
            width: double.infinity,
            height: double.infinity,
            borderRadius: 10,
          ),
          errorWidget: (context, url, error) => const ColoredBox(
            color: AppColors.card,
            child: Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.onSurfaceMuted,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
