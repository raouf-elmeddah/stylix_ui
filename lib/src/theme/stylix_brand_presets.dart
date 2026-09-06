import 'package:flutter/material.dart';
import 'stylix_brand.dart';

/// Provides predefined color presets for [StylixBrand] identities.
class StylixBrandPresets {
  StylixBrandPresets._();

  static const StylixBrandColors defaultBrand = StylixBrandColors(
    primary: Color(0xFF21364C),
    accent: Color(0xFFF18420),
  );

  static const StylixBrandColors jadeCanopy = StylixBrandColors(
    primary: Color(0xFF1F4D3A),
    accent: Color(0xFF55C08A),
  );

  static const StylixBrandColors imperialNova = StylixBrandColors(
    primary: Color(0xFF3A2E7A),
    accent: Color(0xFF8D7CFF),
  );

  static const StylixBrandColors rougeSynth = StylixBrandColors(
    primary: Color(0xFF7A294D),
    accent: Color(0xFFFF6FAE),
  );

  static const StylixBrandColors midnightArmor = StylixBrandColors(
    primary: Color(0xFF1B365D),
    accent: Color(0xFF455A64),
  );
  static const StylixBrandColors toxicFlora = StylixBrandColors(
    primary: Color(0xFF556B2F),
    accent: Color(0xFF9ACD32),
  );

  static StylixBrandColors resolve(StylixBrand brand) {
    switch (brand) {
      case StylixBrand.defaultBrand:
        return defaultBrand;
      case StylixBrand.jadeCanopy:
        return jadeCanopy;
      case StylixBrand.imperialNova:
        return imperialNova;
      case StylixBrand.rougeSynth:
        return rougeSynth;
      case StylixBrand.midnightArmor:
        return midnightArmor;
      case StylixBrand.toxicFlora:
        return toxicFlora;
    }
  }
}
