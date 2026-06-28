import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.leadingIcon,
    this.isLoading = false,
    this.width = double.infinity,
  });

  final String label;
  final VoidCallback? onTap;
  final IconData? leadingIcon;
  final bool isLoading;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width,
        height: 56,
        decoration: BoxDecoration(
          gradient: onTap == null || isLoading
              ? null
              : const LinearGradient(
                  colors: AppColors.gradientPrimary,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
          color: onTap == null || isLoading ? AppColors.onSurfaceMuted.withValues(alpha: 0.2) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: AppColors.onSurface,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leadingIcon != null) ...[
                      Icon(leadingIcon, color: AppColors.onSurface, size: 20),
                      const SizedBox(width: AppSpacing.sm),
                    ],
                    Text(
                      label,
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
