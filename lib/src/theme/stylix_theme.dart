import 'package:flutter/material.dart';

import 'stylix_brand.dart';
import 'stylix_brand_presets.dart';
import 'stylix_palette.dart';
import 'stylix_theme_colors.dart';
import 'stylix_theme_extension.dart';
import 'stylix_theme_tokens.dart';
import 'stylix_typography.dart';
import 'stylix_radius.dart';
import 'stylix_elevation.dart';
import 'stylix_spacing.dart';

/// A utility class for generating Stylix-compliant [ThemeData].
class StylixTheme {
  StylixTheme._();

  /// Generates a light mode [ThemeData] for the specified [brand] and [locale].
  static ThemeData light(StylixBrand brand, {required Locale locale}) {
    final brandColors = StylixBrandPresets.resolve(brand);
    final palette = StylixPalette.light(brandColors);
    final colors = StylixThemeTokens.light(palette);

    final textTheme = StylixTypography.forLocale(
      locale,
      textColor: colors.textPrimary,
    );

    final primaryTextTheme = StylixTypography.forLocale(
      locale,
      textColor: colors.onPrimary,
    );

    return _buildTheme(
      brightness: Brightness.light,
      colors: colors,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
    );
  }

  /// Generates a dark mode [ThemeData] for the specified [brand] and [locale].
  static ThemeData dark(StylixBrand brand, {required Locale locale}) {
    final brandColors = StylixBrandPresets.resolve(brand);
    final palette = StylixPalette.dark(brandColors);
    final colors = StylixThemeTokens.dark(palette);

    final textTheme = StylixTypography.forLocale(
      locale,
      textColor: colors.textPrimary,
    );

    final primaryTextTheme = StylixTypography.forLocale(
      locale,
      textColor: colors.onPrimary,
    );

    return _buildTheme(
      brightness: Brightness.dark,
      colors: colors,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
    );
  }

  static ThemeData _buildTheme({
    required Brightness brightness,
    required StylixThemeColors colors,
    required TextTheme textTheme,
    required TextTheme primaryTextTheme,
  }) {
    final isDark = brightness == Brightness.dark;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.accent,
      onSecondary: colors.onAccent,
      error: colors.error,
      onError: colors.onError,
      surface: colors.surface,
      onSurface: colors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.background,
      canvasColor: colors.background,
      dividerColor: colors.divider,
      shadowColor: colors.shadow,
      splashColor: colors.overlay,
      highlightColor: colors.overlay,

      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,

      extensions: [StylixColorsExtension(colors)],

      appBarTheme: AppBarTheme(
        elevation: StylixElevation.none,
        centerTitle: false,
        backgroundColor: colors.surface,
        foregroundColor: colors.textPrimary,
        surfaceTintColor: Colors.transparent,
        shadowColor: colors.shadow,
        titleTextStyle: textTheme.titleLarge,
      ),

      cardTheme: CardThemeData(
        color: colors.card,
        elevation: isDark ? StylixElevation.none : StylixElevation.xs,
        shadowColor: colors.shadow,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: StylixCorners.xl),
        margin: EdgeInsets.zero,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: StylixCorners.xl),
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
      ),

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colors.surfaceContainerHigh,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colors.textPrimary,
        ),
        shape: const RoundedRectangleBorder(borderRadius: StylixCorners.lg),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.inputFill,
        hintStyle: textTheme.bodyMedium?.copyWith(color: colors.inputHint),
        labelStyle: textTheme.bodyMedium?.copyWith(color: colors.textSecondary),
        prefixIconColor: colors.textMuted,
        suffixIconColor: colors.textMuted,
        contentPadding: StylixInsets.inputContentPadding,
        enabledBorder: OutlineInputBorder(
          borderRadius: StylixCorners.lg,
          borderSide: BorderSide(color: colors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: StylixCorners.lg,
          borderSide: BorderSide(color: colors.primary, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: StylixCorners.lg,
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: StylixCorners.lg,
          borderSide: BorderSide(color: colors.error, width: 1.4),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: StylixCorners.lg,
          borderSide: BorderSide(color: colors.border),
        ),
        border: OutlineInputBorder(
          borderRadius: StylixCorners.lg,
          borderSide: BorderSide(color: colors.inputBorder),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: StylixElevation.none,
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          disabledBackgroundColor: colors.surfaceContainerHigh,
          disabledForegroundColor: colors.textMuted,
          textStyle: textTheme.labelLarge,
          padding: StylixInsets.buttonPadding,
          shape: const RoundedRectangleBorder(borderRadius: StylixCorners.lg),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          textStyle: textTheme.labelLarge,
          side: BorderSide(color: colors.border),
          padding: StylixInsets.buttonPadding,
          shape: const RoundedRectangleBorder(borderRadius: StylixCorners.lg),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          textStyle: textTheme.labelLarge,
          padding: StylixInsets.buttonPadding,
          shape: const RoundedRectangleBorder(borderRadius: StylixCorners.md),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: StylixElevation.md,
        backgroundColor: colors.accent,
        foregroundColor: colors.onAccent,
        shape: const RoundedRectangleBorder(borderRadius: StylixCorners.xl),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colors.surfaceContainer,
        disabledColor: colors.surfaceContainerHigh,
        selectedColor: colors.primaryContainer,
        secondarySelectedColor: colors.primaryContainer,
        padding: StylixInsets.chipPadding,
        labelStyle: textTheme.labelMedium?.copyWith(color: colors.textPrimary),
        secondaryLabelStyle: textTheme.labelMedium?.copyWith(
          color: colors.onPrimaryContainer,
        ),
        side: BorderSide(color: colors.border),
        shape: const RoundedRectangleBorder(borderRadius: StylixCorners.md),
      ),

      checkboxTheme: const CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: StylixCorners.xs),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.textMuted;
        }),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.onPrimary;
          }
          return StylixPalette.neutral.n0;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return StylixPalette.neutral.n300;
        }),
      ),

      sliderTheme: SliderThemeData(
        activeTrackColor: colors.primary,
        inactiveTrackColor: colors.surfaceContainerHigh,
        thumbColor: colors.primary,
        overlayColor: colors.primary.withValues(alpha: 0.12),
        valueIndicatorColor: colors.primary,
        valueIndicatorTextStyle: textTheme.labelMedium?.copyWith(
          color: colors.onPrimary,
        ),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.primary,
        linearTrackColor: colors.surfaceContainerHigh,
        circularTrackColor: colors.surfaceContainerHigh,
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.surface,
        indicatorColor: colors.primaryContainer,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return textTheme.labelMedium?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w700,
            );
          }
          return textTheme.labelMedium?.copyWith(color: colors.textSecondary);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colors.primary);
          }
          return IconThemeData(color: colors.textSecondary);
        }),
      ),
    );
  }
}
