import 'package:flutter/material.dart';

import 'stylix_radius.dart';
import 'stylix_spacing.dart';
import 'stylix_theme_colors.dart';

class AppButtonStyles {
  AppButtonStyles._();

  static ButtonStyle primary(StylixThemeColors c, TextTheme textTheme) {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: c.primary,
      foregroundColor: c.onPrimary,
      padding: StylixInsets.buttonPadding,
      textStyle: textTheme.labelLarge,
      shape: const RoundedRectangleBorder(borderRadius: StylixCorners.lg),
    );
  }

  static ButtonStyle accent(StylixThemeColors c, TextTheme textTheme) {
    return FilledButton.styleFrom(
      backgroundColor: c.accent,
      foregroundColor: c.onAccent,
      padding: StylixInsets.buttonPadding,
      textStyle: textTheme.labelLarge,
      shape: const RoundedRectangleBorder(borderRadius: StylixCorners.lg),
    );
  }

  static ButtonStyle outline(StylixThemeColors c, TextTheme textTheme) {
    return OutlinedButton.styleFrom(
      foregroundColor: c.primary,
      padding: StylixInsets.buttonPadding,
      textStyle: textTheme.labelLarge,
      side: BorderSide(color: c.border),
      shape: const RoundedRectangleBorder(borderRadius: StylixCorners.lg),
    );
  }

  static ButtonStyle text(StylixThemeColors c, TextTheme textTheme) {
    return TextButton.styleFrom(
      foregroundColor: c.primary,
      padding: StylixInsets.buttonPadding,
      textStyle: textTheme.labelLarge,
      shape: const RoundedRectangleBorder(borderRadius: StylixCorners.md),
    );
  }
}
