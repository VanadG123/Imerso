import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.label,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.iconColor,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final effectiveColor =
        isDestructive ? AppColors.error : (iconColor ?? AppColors.primary);

    return ListTile(
      minTileHeight: 56,
      onTap: onTap,
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: effectiveColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20, color: effectiveColor),
      ),
      title: Text(
        label,
        style: AppTextStyles.bodyMedium.copyWith(
          color: isDestructive ? AppColors.error : AppColors.onSurface,
        ),
      ),
      subtitle: subtitle != null
          ? Text(subtitle!, style: AppTextStyles.caption)
          : null,
      trailing: trailing ??
          (onTap != null
              ? const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.onSurfaceMuted,
                  size: 20,
                )
              : null),
    );
  }
}
