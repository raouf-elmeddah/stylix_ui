import 'package:flutter/material.dart';

import 'stylix_theme_colors.dart';

class StylixElevation {
  StylixElevation._();

  static const double none = 0.0;
  static const double xs = 1.0;
  static const double sm = 2.0;
  static const double md = 4.0;
  static const double lg = 8.0;
  static const double xl = 12.0;
}

class AppShadows {
  AppShadows._();

  static List<BoxShadow> none(StylixThemeColors c) => const [];

  static List<BoxShadow> xs(StylixThemeColors c) => [
    BoxShadow(
      color: c.shadow.withValues(alpha: 0.08),
      blurRadius: 6,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> sm(StylixThemeColors c) => [
    BoxShadow(
      color: c.shadow.withValues(alpha: 0.10),
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> md(StylixThemeColors c) => [
    BoxShadow(
      color: c.shadow.withValues(alpha: 0.12),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> lg(StylixThemeColors c) => [
    BoxShadow(
      color: c.shadow.withValues(alpha: 0.14),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> xl(StylixThemeColors c) => [
    BoxShadow(
      color: c.shadow.withValues(alpha: 0.16),
      blurRadius: 32,
      offset: const Offset(0, 12),
    ),
  ];
}
