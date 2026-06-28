import 'package:flutter/material.dart';

abstract final class AppColors {
  // Background hierarchy
  static const Color background = Color(0xFF0D0D14);
  static const Color surface = Color(0xFF12121A);
  static const Color card = Color(0xFF16161E);
  static const Color cardElevated = Color(0xFF1C1C26);

  // Brand
  static const Color primary = Color(0xFF7C3AED);
  static const Color primaryLight = Color(0xFFA78BFA);
  static const Color secondary = Color(0xFF06B6D4);
  static const Color accent = Color(0xFFF472B6);

  // Text
  static const Color onSurface = Color(0xFFF8F8FF);
  static const Color onSurfaceMuted = Color(0xFF94949E);

  // Border
  static const Color border = Color(0x14FFFFFF); // rgba(255,255,255,0.08)

  // Semantic
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Gradients
  static const List<Color> gradientPrimary = [Color(0xFF7C3AED), Color(0xFF2563EB)];
  static const List<Color> gradientAccent = [Color(0xFFF472B6), Color(0xFF7C3AED)];
}
