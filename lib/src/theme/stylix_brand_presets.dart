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

  static const StylixBrandColors arcticForge = StylixBrandColors(
    primary: Color(0xFFFE2E39),
    accent: Color(0xFFDCF6FF),
  );

  static const StylixBrandColors skylinePulse = StylixBrandColors(
    primary: Color(0xFF0239FF),
    accent: Color(0xFFD5E3FF),
  );

  static const StylixBrandColors neonVelvet = StylixBrandColors(
    primary: Color(0xFF2E0F36),
    accent: Color(0xFFFF7FEC),
  );

  static const StylixBrandColors violetAlloy = StylixBrandColors(
    primary: Color(0xFF3E0079),
    accent: Color(0xFFE9EDF3),
  );

  static const StylixBrandColors phantomMint = StylixBrandColors(
    primary: Color(0xFF050505),
    accent: Color(0xFFD6FFDF),
  );

  static const StylixBrandColors emberCore = StylixBrandColors(
    primary: Color(0xFFFF902F),
    accent: Color(0xFF111927),
  );

  static const StylixBrandColors royalBlush = StylixBrandColors(
    primary: Color(0xFF3447AA),
    accent: Color(0xFFFBEAEB),
  );

  static const StylixBrandColors deepForest = StylixBrandColors(
    primary: Color(0xFF9FE870),
    accent: Color(0xFF163300),
  );

  static const StylixBrandColors tidalMist = StylixBrandColors(
    primary: Color(0xFFBDD9D7),
    accent: Color(0xFF03363D),
  );

  static const StylixBrandColors solarEclipse = StylixBrandColors(
    primary: Color(0xFFFCDB32),
    accent: Color(0xFF141D38),
  );

  static const StylixBrandColors neonTide = StylixBrandColors(
    primary: Color(0xFF34E0A1),
    accent: Color(0xFF000000),
  );

  static const StylixBrandColors lavenderPulse = StylixBrandColors(
    primary: Color(0xFF6260FF),
    accent: Color(0xFFE4E4FF),
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
      case StylixBrand.arcticForge:
        return arcticForge;
      case StylixBrand.skylinePulse:
        return skylinePulse;
      case StylixBrand.neonVelvet:
        return neonVelvet;
      case StylixBrand.violetAlloy:
        return violetAlloy;
      case StylixBrand.phantomMint:
        return phantomMint;
      case StylixBrand.emberCore:
        return emberCore;
      case StylixBrand.royalBlush:
        return royalBlush;
      case StylixBrand.deepForest:
        return deepForest;
      case StylixBrand.tidalMist:
        return tidalMist;
      case StylixBrand.solarEclipse:
        return solarEclipse;
      case StylixBrand.neonTide:
        return neonTide;
      case StylixBrand.lavenderPulse:
        return lavenderPulse;
    }
  }
}
