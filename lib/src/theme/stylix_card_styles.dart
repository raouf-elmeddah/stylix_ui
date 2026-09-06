import 'package:flutter/material.dart';

import 'stylix_elevation.dart';
import 'stylix_radius.dart';
import 'stylix_spacing.dart';
import 'stylix_theme_colors.dart';

class AppCardStyles {
  AppCardStyles._();

  static BoxDecoration surface(StylixThemeColors c) {
    return BoxDecoration(
      color: c.card,
      borderRadius: StylixCorners.xl,
      border: Border.all(color: c.border),
      boxShadow: AppShadows.md(c),
    );
  }

  static BoxDecoration muted(StylixThemeColors c) {
    return BoxDecoration(
      color: c.surfaceContainer,
      borderRadius: StylixCorners.xl,
      border: Border.all(color: c.border),
      boxShadow: AppShadows.sm(c),
    );
  }

  static EdgeInsets get padding => StylixInsets.cardPadding;
}

