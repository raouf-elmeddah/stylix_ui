import 'package:flutter/material.dart';

/// Contains the complete set of resolved semantic design tokens for the theme.
class StylixThemeColors {
  final Color background;
  final Color surface;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;

  final Color border;
  final Color divider;
  final Color card;
  final Color shadow;
  final Color overlay;

  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textInverse;

  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;

  final Color accent;
  final Color onAccent;

  final Color success;
  final Color warning;
  final Color info;
  final Color error;
  final Color onError;

  final Color inputFill;
  final Color inputBorder;
  final Color inputHint;

  final Color successContainer;
  final Color warningContainer;
  final Color infoContainer;
  final Color errorContainer;

  const StylixThemeColors({
    required this.background,
    required this.surface,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.border,
    required this.divider,
    required this.card,
    required this.shadow,
    required this.overlay,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textInverse,
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.accent,
    required this.onAccent,
    required this.success,
    required this.warning,
    required this.info,
    required this.error,
    required this.onError,
    required this.inputFill,
    required this.inputBorder,
    required this.inputHint,
    required this.successContainer,
    required this.warningContainer,
    required this.infoContainer,
    required this.errorContainer,
  });

  StylixThemeColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? border,
    Color? divider,
    Color? card,
    Color? shadow,
    Color? overlay,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? textInverse,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? accent,
    Color? onAccent,
    Color? success,
    Color? warning,
    Color? info,
    Color? error,
    Color? onError,
    Color? inputFill,
    Color? inputBorder,
    Color? inputHint,
    Color? successContainer,
    Color? warningContainer,
    Color? infoContainer,
    Color? errorContainer,
  }) {
    return StylixThemeColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      card: card ?? this.card,
      shadow: shadow ?? this.shadow,
      overlay: overlay ?? this.overlay,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      textInverse: textInverse ?? this.textInverse,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      inputFill: inputFill ?? this.inputFill,
      inputBorder: inputBorder ?? this.inputBorder,
      inputHint: inputHint ?? this.inputHint,
      successContainer: successContainer ?? this.successContainer,
      warningContainer: warningContainer ?? this.warningContainer,
      infoContainer: infoContainer ?? this.infoContainer,
      errorContainer: errorContainer ?? this.errorContainer,
    );
  }

  static StylixThemeColors lerp(
    StylixThemeColors a,
    StylixThemeColors b,
    double t,
  ) {
    return StylixThemeColors(
      background: Color.lerp(a.background, b.background, t)!,
      surface: Color.lerp(a.surface, b.surface, t)!,
      surfaceContainer: Color.lerp(a.surfaceContainer, b.surfaceContainer, t)!,
      surfaceContainerHigh: Color.lerp(
        a.surfaceContainerHigh,
        b.surfaceContainerHigh,
        t,
      )!,
      border: Color.lerp(a.border, b.border, t)!,
      divider: Color.lerp(a.divider, b.divider, t)!,
      card: Color.lerp(a.card, b.card, t)!,
      shadow: Color.lerp(a.shadow, b.shadow, t)!,
      overlay: Color.lerp(a.overlay, b.overlay, t)!,
      textPrimary: Color.lerp(a.textPrimary, b.textPrimary, t)!,
      textSecondary: Color.lerp(a.textSecondary, b.textSecondary, t)!,
      textMuted: Color.lerp(a.textMuted, b.textMuted, t)!,
      textInverse: Color.lerp(a.textInverse, b.textInverse, t)!,
      primary: Color.lerp(a.primary, b.primary, t)!,
      onPrimary: Color.lerp(a.onPrimary, b.onPrimary, t)!,
      primaryContainer: Color.lerp(a.primaryContainer, b.primaryContainer, t)!,
      onPrimaryContainer: Color.lerp(
        a.onPrimaryContainer,
        b.onPrimaryContainer,
        t,
      )!,
      accent: Color.lerp(a.accent, b.accent, t)!,
      onAccent: Color.lerp(a.onAccent, b.onAccent, t)!,
      success: Color.lerp(a.success, b.success, t)!,
      warning: Color.lerp(a.warning, b.warning, t)!,
      info: Color.lerp(a.info, b.info, t)!,
      error: Color.lerp(a.error, b.error, t)!,
      onError: Color.lerp(a.onError, b.onError, t)!,
      inputFill: Color.lerp(a.inputFill, b.inputFill, t)!,
      inputBorder: Color.lerp(a.inputBorder, b.inputBorder, t)!,
      inputHint: Color.lerp(a.inputHint, b.inputHint, t)!,
      successContainer: Color.lerp(a.successContainer, b.successContainer, t)!,
      warningContainer: Color.lerp(a.warningContainer, b.warningContainer, t)!,
      infoContainer: Color.lerp(a.infoContainer, b.infoContainer, t)!,
      errorContainer: Color.lerp(a.errorContainer, b.errorContainer, t)!,
    );
  }
}
