import 'package:flutter/material.dart';

/// Represents the available brand identities within Stylix UI.
enum StylixBrand {
  defaultBrand,
  jadeCanopy,
  imperialNova,
  rougeSynth,
  midnightArmor,
  toxicFlora,
  arcticForge,
  skylinePulse,
  neonVelvet,
  violetAlloy,
  phantomMint,
  emberCore,
  royalBlush,
  deepForest,
  tidalMist,
  solarEclipse,
  neonTide,
  lavenderPulse,
}

/// Defines the core primary and accent colors for a brand.
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
      case StylixBrand.arcticForge:
        return 'Arctic Forge';
      case StylixBrand.skylinePulse:
        return 'Skyline Pulse';
      case StylixBrand.neonVelvet:
        return 'Neon Velvet';
      case StylixBrand.violetAlloy:
        return 'Violet Alloy';
      case StylixBrand.phantomMint:
        return 'Phantom Mint';
      case StylixBrand.emberCore:
        return 'Ember Core';
      case StylixBrand.royalBlush:
        return 'Royal Blush';
      case StylixBrand.deepForest:
        return 'Deep Forest';
      case StylixBrand.tidalMist:
        return 'Tidal Mist';
      case StylixBrand.solarEclipse:
        return 'Solar Eclipse';
      case StylixBrand.neonTide:
        return 'Neon Tide';
      case StylixBrand.lavenderPulse:
        return 'Lavender Pulse';
    }
  }
}
