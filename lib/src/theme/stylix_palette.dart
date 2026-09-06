import 'package:flutter/material.dart';
import 'stylix_brand.dart';

class StylixPalette {
  StylixPalette._();

  static const StylixPaletteNeutral neutral = StylixPaletteNeutral._();
  static const StylixPaletteSemantic semantic = StylixPaletteSemantic._();

  static StylixPaletteLight light(StylixBrandColors brand) => StylixPaletteLight(brand);
  static StylixPaletteDark dark(StylixBrandColors brand) => StylixPaletteDark(brand);

  static Color container(Color base, [double opacity = 0.12]) {
    return base.withValues(alpha: opacity);
  }
}

class StylixPaletteNeutral {
  const StylixPaletteNeutral._();

  final Color n0 = const Color(0xFFFFFFFF);
  final Color n50 = const Color(0xFFF7F8FA);
  final Color n100 = const Color(0xFFF1F3F5);
  final Color n200 = const Color(0xFFD9E0E6);
  final Color n300 = const Color(0xFFC4CCD4);
  final Color n400 = const Color(0xFF8A96A3);
  final Color n500 = const Color(0xFF5D6B78);
  final Color n700 = const Color(0xFF2C3A47);
  final Color n900 = const Color(0xFF162331);
}

class StylixPaletteSemantic {
  const StylixPaletteSemantic._();

  final Color success = const Color(0xFF239B56);
  final Color warning = const Color(0xFFF18420);
  final Color info = const Color(0xFF2F80ED);
  final Color error = const Color(0xFFD64545);
}

class StylixPaletteLight {
  final StylixBrandColors brand;

  StylixPaletteLight(this.brand);

  Color get background => StylixPalette.neutral.n0;
  Color get surface => background;
  Color get surfaceContainer => StylixPalette.neutral.n50;
  Color get surfaceContainerHigh => StylixPalette.neutral.n100;

  Color get border => StylixPalette.neutral.n200;
  final Color divider = const Color(0xFFE7EBEF);
  Color get card => surface;
  final Color shadow = const Color(0x14000000);
  final Color overlay = const Color(0x0F000000);

  Color get textPrimary => brand.primary;
  Color get textSecondary => StylixPalette.neutral.n500;
  Color get textMuted => StylixPalette.neutral.n400;
  Color get textInverse => background;

  Color get primary => brand.primary;
  Color get onPrimary => brand.onPrimary;
  Color get accent => brand.accent;
  Color get onAccent => brand.onAccent;

  final Color inputFill = const Color(0xFFF8F9FB);
  final Color inputBorder = const Color(0xFFD6DCE2);
  Color get inputHint => textMuted;
}

class StylixPaletteDark {
  final StylixBrandColors brand;

  StylixPaletteDark(this.brand);

  Color get background => StylixPalette.neutral.n900;
  final Color surface = const Color(0xFF1B2B3A);
  final Color surfaceContainer = const Color(0xFF223447);
  final Color surfaceContainerHigh = const Color(0xFF2B4157);

  final Color border = const Color(0xFF395066);
  final Color divider = const Color(0xFF31475C);
  Color get card => brand.primary;
  final Color shadow = const Color(0x33000000);
  final Color overlay = const Color(0x1FFFFFFF);

  Color get textPrimary => StylixPalette.neutral.n0;
  final Color textSecondary = const Color(0xFFD3DAE1);
  final Color textMuted = const Color(0xFFAAB6C2);
  Color get textInverse => brand.primary;

  final Color primary = const Color(0xFFDCE6EF);
  Color get onPrimary => brand.primary;
  Color get accent => brand.accent;
  Color get onAccent => brand.onAccent;

  final Color inputFill = const Color(0xFF24384C);
  final Color inputBorder = const Color(0xFF45607A);
  Color get inputHint => textMuted;
}

