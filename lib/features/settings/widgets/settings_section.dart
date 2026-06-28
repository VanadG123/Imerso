import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
    this.isDanger = false,
  });

  final String title;
  final List<Widget> children;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppSpacing.md,
            bottom: AppSpacing.sm,
          ),
          child: Text(
            title,
            style: AppTextStyles.caption.copyWith(letterSpacing: 1.1),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: isDanger
                ? Border.all(
                    color: AppColors.error.withValues(alpha: 0.3),
                  )
                : null,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: children.length,
            separatorBuilder: (_, __) => const Divider(
              color: AppColors.border,
              height: 1,
              thickness: 0.5,
              indent: AppSpacing.md,
              endIndent: AppSpacing.md,
            ),
            itemBuilder: (_, i) => children[i],
          ),
        ),
      ],
    );
  }
}
