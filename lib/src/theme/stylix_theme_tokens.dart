import 'package:flutter/material.dart';
import 'stylix_palette.dart';
import 'stylix_theme_colors.dart';

class StylixThemeTokens {
  StylixThemeTokens._();

  static StylixThemeColors light(StylixPaletteLight p) {
    return StylixThemeColors(
      background: p.background,
      surface: p.surface,
      surfaceContainer: p.surfaceContainer,
      surfaceContainerHigh: p.surfaceContainerHigh,
      border: p.border,
      divider: p.divider,
      card: p.card,
      shadow: p.shadow,
      overlay: p.overlay,
      textPrimary: p.textPrimary,
      textSecondary: p.textSecondary,
      textMuted: p.textMuted,
      textInverse: p.textInverse,
      primary: p.primary,
      onPrimary: p.onPrimary,
      primaryContainer: StylixPalette.container(p.primary, 0.12),
      onPrimaryContainer: p.primary,
      accent: p.accent,
      onAccent: p.onAccent,
      success: StylixPalette.semantic.success,
      warning: StylixPalette.semantic.warning,
      info: StylixPalette.semantic.info,
      error: StylixPalette.semantic.error,
      onError: Colors.white,
      inputFill: p.inputFill,
      inputBorder: p.inputBorder,
      inputHint: p.inputHint,
      successContainer: StylixPalette.container(
        StylixPalette.semantic.success,
        0.12,
      ),
      warningContainer: StylixPalette.container(
        StylixPalette.semantic.warning,
        0.12,
      ),
      infoContainer: StylixPalette.container(StylixPalette.semantic.info, 0.12),
      errorContainer: StylixPalette.container(
        StylixPalette.semantic.error,
        0.12,
      ),
    );
  }

  static StylixThemeColors dark(StylixPaletteDark p) {
    return StylixThemeColors(
      background: p.background,
      surface: p.surface,
      surfaceContainer: p.surfaceContainer,
      surfaceContainerHigh: p.surfaceContainerHigh,
      border: p.border,
      divider: p.divider,
      card: p.card,
      shadow: p.shadow,
      overlay: p.overlay,
      textPrimary: p.textPrimary,
      textSecondary: p.textSecondary,
      textMuted: p.textMuted,
      textInverse: p.textInverse,
      primary: p.primary,
      onPrimary: p.onPrimary,
      primaryContainer: StylixPalette.container(p.primary, 0.20),
      onPrimaryContainer: p.onPrimary,
      accent: p.accent,
      onAccent: p.onAccent,
      success: StylixPalette.semantic.success,
      warning: StylixPalette.semantic.warning,
      info: StylixPalette.semantic.info,
      error: StylixPalette.semantic.error,
      onError: Colors.white,
      inputFill: p.inputFill,
      inputBorder: p.inputBorder,
      inputHint: p.inputHint,
      successContainer: StylixPalette.container(
        StylixPalette.semantic.success,
        0.20,
      ),
      warningContainer: StylixPalette.container(
        StylixPalette.semantic.warning,
        0.20,
      ),
      infoContainer: StylixPalette.container(StylixPalette.semantic.info, 0.20),
      errorContainer: StylixPalette.container(
        StylixPalette.semantic.error,
        0.20,
      ),
    );
  }
}
