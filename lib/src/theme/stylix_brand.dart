import 'package:flutter/material.dart';

enum StylixBrand {
  defaultBrand,
  jadeCanopy,
  imperialNova,
  rougeSynth,
  midnightArmor,
  toxicFlora,
}

@immutable
class StylixBrandColors {
  final Color primary;
  final Color accent;

  const StylixBrandColors({required this.primary, required this.accent});

  Color get onPrimary =>
      primary.computeLuminance() > 0.5 ? Colors.black : Colors.white;

  Color get onAccent =>
      accent.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}

extension StylixBrandExtension on StylixBrand {
  /// Returns a human-readable display name for the UI.
  String get displayName {
    switch (this) {
      case StylixBrand.defaultBrand:
        return 'Default';
      case StylixBrand.jadeCanopy:
        return 'Jade Canopy';
      case StylixBrand.imperialNova:
        return 'Imperial Nova';
      case StylixBrand.rougeSynth:
        return 'Rouge Synth';
      case StylixBrand.midnightArmor:
        return 'Midnight Armor';
      case StylixBrand.toxicFlora:
        return 'Toxic Flora';
    }
  }
}
