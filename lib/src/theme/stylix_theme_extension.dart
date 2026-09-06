import 'package:flutter/material.dart';
import 'stylix_theme_colors.dart';

class StylixColorsExtension extends ThemeExtension<StylixColorsExtension> {
  final StylixThemeColors colors;

  const StylixColorsExtension(this.colors);

  @override
  StylixColorsExtension copyWith({StylixThemeColors? colors}) {
    return StylixColorsExtension(colors ?? this.colors);
  }

  @override
  StylixColorsExtension lerp(ThemeExtension<StylixColorsExtension>? other, double t) {
    if (other is! StylixColorsExtension) return this;
    return StylixColorsExtension(StylixThemeColors.lerp(colors, other.colors, t));
  }
}

extension StylixThemeContextExtension on BuildContext {
  StylixThemeColors get stylixColors {
    final extension = Theme.of(this).extension<StylixColorsExtension>();
    assert(extension != null, 'StylixColorsExtension not found in ThemeData');
    return extension!.colors;
  }
}

