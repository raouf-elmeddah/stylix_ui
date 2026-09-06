// app_gradients.dart
import 'package:flutter/material.dart';

/// A gradient color option that the user can select as a background/theme.
@immutable
class AppGradient {
  final String id; // A constant key for storage (SharedPreferences/Hive/...).
  final String name; // Display name
  final Color c1;
  final Color c2;
  final String description;

  const AppGradient({
    required this.id,
    required this.name,
    required this.c1,
    required this.c2,
    required this.description,
  });

  /// A default gradient suitable for backgrounds (top left to bottom right).
  LinearGradient get linear => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [c1, c2],
      );

  /// Alternative: A vertical gradient if needed in specific places.
  LinearGradient get vertical => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [c1, c2],
      );
}

class AppGradients {
  AppGradients._();

  /// All gradients available for selection within the app.
  static const List<AppGradient> all = [
    AppGradient(
      id: 'sunlit_glow',
      name: 'Sunlit Glow',
      c1: Color(0xFFFDEB71),
      c2: Color(0xFFF8D800),
      description:
          '🌞 Ideal for summer themes, energetic CTAs, or warm app headers to evoke joy and positivity.',
    ),
    AppGradient(
      id: 'ocean_breeze',
      name: 'Ocean Breeze',
      c1: Color(0xFFABDCFF),
      c2: Color(0xFF0396FF),
      description:
          '🌊 Perfect for serene navigation bars or wellness apps, conveying calmness and flow.',
    ),
    AppGradient(
      id: 'sunset_blush',
      name: 'Sunset Blush',
      c1: Color(0xFFFEB692),
      c2: Color(0xFFEA5455),
      description:
          '🌅 Use for romantic UIs, sunset-themed cards, or alerts to add a soft, inviting warmth.',
    ),
    AppGradient(
      id: 'lavender_dream',
      name: 'Lavender Dream',
      c1: Color(0xFFCE9FFC),
      c2: Color(0xFF7367F0),
      description:
          '💜 Great for creative portfolios or meditation apps, inspiring tranquility and imagination.',
    ),
    AppGradient(
      id: 'aqua_splash',
      name: 'Aqua Splash',
      c1: Color(0xFF90F7EC),
      c2: Color(0xFF32CCBC),
      description:
          '💦 Best for fresh e-commerce buttons or water-themed designs, refreshing and vibrant.',
    ),
    AppGradient(
      id: 'coral_crush',
      name: 'Coral Crush',
      c1: Color(0xFFFF9A8B),
      c2: Color(0xFFFF6A88),
      description:
          '🐚 Ideal for social media feeds or fun pop-ups, adding playful energy and appeal.',
    ),
    AppGradient(
      id: 'emerald_wave',
      name: 'Emerald Wave',
      c1: Color(0xFFA8E063),
      c2: Color(0xFF56AB2F),
      description:
          '🍃 Use for eco-friendly sites or growth trackers, symbolizing nature and renewal.',
    ),
    AppGradient(
      id: 'pink_lemonade',
      name: 'Pink Lemonade',
      c1: Color(0xFFFFF6B7),
      c2: Color(0xFFF6416C),
      description:
          '🍋 Perfect for youthful branding or drink apps, blending sweet and tangy vibes.',
    ),
    AppGradient(
      id: 'mint_fusion',
      name: 'Mint Fusion',
      c1: Color(0xFF81FBB8),
      c2: Color(0xFF28C76F),
      description:
          '🌿 Great for health trackers or modern forms, evoking freshness and balance.',
    ),
    AppGradient(
      id: 'violet_haze',
      name: 'Violet Haze',
      c1: Color(0xFFE2B0FF),
      c2: Color(0xFF9F44D3),
      description:
          '🌫️ Ideal for artistic galleries or evening modes, adding mystery and elegance.',
    ),
    AppGradient(
      id: 'berry_dusk',
      name: 'Berry Dusk',
      c1: Color(0xFFF97794),
      c2: Color(0xFF623AA2),
      description:
          '🍇 Use for dusk-themed dashboards or berry-flavored UIs, warm and introspective.',
    ),
    AppGradient(
      id: 'fiery_dawn',
      name: 'Fiery Dawn',
      c1: Color(0xFFFCCF31),
      c2: Color(0xFFF55555),
      description:
          '🔥 Best for motivational banners or dawn alerts, igniting passion and urgency.',
    ),
    AppGradient(
      id: 'magenta_pulse',
      name: 'Magenta Pulse',
      c1: Color(0xFFF761A1),
      c2: Color(0xFF8C1BAB),
      description:
          '💓 Perfect for pulsing animations or music apps, vibrant and heartbeat-like.',
    ),
    AppGradient(
      id: 'neon_sky',
      name: 'Neon Sky',
      c1: Color(0xFF43CBFF),
      c2: Color(0xFF9708CC),
      description:
          '🌌 Ideal for sci-fi themes or night skies, electric and futuristic.',
    ),
    AppGradient(
      id: 'turquoise_tide',
      name: 'Turquoise Tide',
      c1: Color(0xFF5EFCE8),
      c2: Color(0xFF736EFE),
      description:
          '🌊 Use for tidal waves in games or ocean explorers, fluid and adventurous.',
    ),
    AppGradient(
      id: 'peach_glow',
      name: 'Peach Glow',
      c1: Color(0xFFFAD7A1),
      c2: Color(0xFFE96D71),
      description:
          '🍑 Great for cozy chat bubbles or peach sunsets, soft and comforting.',
    ),
    AppGradient(
      id: 'citrus_sky',
      name: 'Citrus Sky',
      c1: Color(0xFFFFD26F),
      c2: Color(0xFF3677FF),
      description:
          '🍊 Perfect for citrusy skies in travel apps, zesty and uplifting.',
    ),
    AppGradient(
      id: 'lime_pop',
      name: 'Lime Pop',
      c1: Color(0xFFA0FE65),
      c2: Color(0xFFFA016D),
      description:
          '🍈 Ideal for pop-up notifications or lime bursts, fun and surprising.',
    ),
    AppGradient(
      id: 'golden_night',
      name: 'Golden Night',
      c1: Color(0xFFFFDB01),
      c2: Color(0xFF0E197D),
      description:
          '⭐ Use for golden hour to night transitions, luxurious and dramatic.',
    ),
    AppGradient(
      id: 'amber_flame',
      name: 'Amber Flame',
      c1: Color(0xFFFEC163),
      c2: Color(0xFFDE4313),
      description:
          '🔥 Best for flame effects or autumn leaves, warm and intense.',
    ),
    AppGradient(
      id: 'teal_abyss',
      name: 'Teal Abyss',
      c1: Color(0xFF92FFC0),
      c2: Color(0xFF002661),
      description:
          '🌌 Great for deep-sea explorations or abyss dives, mysterious and deep.',
    ),
    AppGradient(
      id: 'copper_violet',
      name: 'Copper Violet',
      c1: Color(0xFFEEAD92),
      c2: Color(0xFF6018DC),
      description:
          '🟠 Ideal for metallic accents or violet metals, rich and sophisticated.',
    ),
    AppGradient(
      id: 'bubblegum_bliss',
      name: 'Bubblegum Bliss',
      c1: Color(0xFFF6CEEC),
      c2: Color(0xFFD939CD),
      description:
          '🍬 Perfect for candy apps or bliss modes, sweet and bubbly.',
    ),
    AppGradient(
      id: 'aqua_indigo',
      name: 'Aqua Indigo',
      c1: Color(0xFF52E5E7),
      c2: Color(0xFF130CB7),
      description:
          '💙 Use for indigo waters or aqua depths, cool and immersive.',
    ),
    AppGradient(
      id: 'saffron_plum',
      name: 'Saffron Plum',
      c1: Color(0xFFF1CA74),
      c2: Color(0xFFA64DB6),
      description:
          '🍊 Great for spice markets or plum fusions, exotic and flavorful.',
    ),
    AppGradient(
      id: 'mustard_twilight',
      name: 'Mustard Twilight',
      c1: Color(0xFFE8D07A),
      c2: Color(0xFF5312D6),
      description:
          '🌆 Ideal for twilight scenes or mustard skies, earthy and twilight-magic.',
    ),
    AppGradient(
      id: 'lemon_zest',
      name: 'Lemon Zest',
      c1: Color(0xFFEECE13),
      c2: Color(0xFFB210FF),
      description:
          '🍋 Best for zesty highlights or lemon pops, bright and invigorating.',
    ),
    AppGradient(
      id: 'green_sapphire',
      name: 'Green Sapphire',
      c1: Color(0xFF79F1A4),
      c2: Color(0xFF0E5CAD),
      description:
          '💎 Use for gemstone effects or sapphire greens, luxurious and gem-like.',
    ),
    AppGradient(
      id: 'crimson_flare',
      name: 'Crimson Flare',
      c1: Color(0xFFFDD819),
      c2: Color(0xFFE80505),
      description:
          '🔴 Perfect for flare warnings or crimson sunrises, bold and alerting.',
    ),
    AppGradient(
      id: 'canary_amethyst',
      name: 'Canary Amethyst',
      c1: Color(0xFFFFF3B0),
      c2: Color(0xFFCA26FF),
      description:
          '🐦 Great for bird-themed or amethyst glows, cheerful and purple-hued.',
    ),
    AppGradient(
      id: 'peach_rose',
      name: 'Peach Rose',
      c1: Color(0xFFFFAA85),
      c2: Color(0xFFB3315F),
      description:
          '🌹 Ideal for rose gardens or peach blooms, romantic and floral.',
    ),
    AppGradient(
      id: 'sky_sapphire',
      name: 'Sky Sapphire',
      c1: Color(0xFF72EDF2),
      c2: Color(0xFF5151E5),
      description:
          '☁️ Use for sky-high banners or sapphire blues, airy and expansive.',
    ),
    AppGradient(
      id: 'coral_berry',
      name: 'Coral Berry',
      c1: Color(0xFFFF9D6C),
      c2: Color(0xFFBB4E75),
      description:
          '🍓 Perfect for berry corals or fruit UIs, juicy and appetizing.',
    ),
    AppGradient(
      id: 'mango_magenta',
      name: 'Mango Magenta',
      c1: Color(0xFFF6D242),
      c2: Color(0xFFFF52E5),
      description:
          '🥭 Great for tropical mangoes or magenta fruits, exotic and bold.',
    ),
    AppGradient(
      id: 'mint_cyan',
      name: 'Mint Cyan',
      c1: Color(0xFF69FF97),
      c2: Color(0xFF00E4FF),
      description:
          '🧁 Ideal for minty cyans in candy worlds, cool and mint-fresh.',
    ),
    AppGradient(
      id: 'midnight_bloom',
      name: 'Midnight Bloom',
      c1: Color(0xFF3B2667),
      c2: Color(0xFFBC78EC),
      description:
          '🌸 Use for midnight flowers or bloom effects, nocturnal and blooming.',
    ),
    AppGradient(
      id: 'lime_burst',
      name: 'Lime Burst',
      c1: Color(0xFF70F570),
      c2: Color(0xFF49C628),
      description:
          '💥 Perfect for burst animations or lime explosions, energetic and green.',
    ),
    AppGradient(
      id: 'blue_horizon',
      name: 'Blue Horizon',
      c1: Color(0xFF3C8CE7),
      c2: Color(0xFF00EAFF),
      description:
          '🏔️ Great for horizon lines or blue vistas, vast and horizon-bound.',
    ),
    AppGradient(
      id: 'fuchsia_night',
      name: 'Fuchsia Night',
      c1: Color(0xFFFAB2FF),
      c2: Color(0xFF1904E5),
      description:
          '🌃 Ideal for night fuchsias or party nights, vibrant and nocturnal.',
    ),
    AppGradient(
      id: 'teal_blush',
      name: 'Teal Blush',
      c1: Color(0xFF81FFEF),
      c2: Color(0xFFF067B4),
      description:
          '😊 Use for blushed teals in beauty apps, soft and blushing.',
    ),
    AppGradient(
      id: 'pink_sunrise',
      name: 'Pink Sunrise',
      c1: Color(0xFFFFA8A8),
      c2: Color(0xFFFCFF00),
      description:
          '🌅 Perfect for sunrise pinks or dawn starts, hopeful and rising.',
    ),
    AppGradient(
      id: 'golden_blue',
      name: 'Golden Blue',
      c1: Color(0xFFFFCF71),
      c2: Color(0xFF2376DD),
      description:
          '🟡 Great for golden blues in ocean golds, precious and oceanic.',
    ),
    AppGradient(
      id: 'vivid_plum',
      name: 'Vivid Plum',
      c1: Color(0xFFFF96F9),
      c2: Color(0xFFC32BAC),
      description:
          '🍇 Ideal for vivid plums in fruit designs, intense and plumy.',
    ),
    AppGradient(
      id: 'mint_cobalt',
      name: 'Mint Cobalt',
      c1: Color(0xFFC2FFD8),
      c2: Color(0xFF465EFB),
      description: '🟦 Use for cobalt mints in tech UIs, modern and mint-cool.',
    ),
    AppGradient(
      id: 'crimson_cobalt',
      name: 'Crimson Cobalt',
      c1: Color(0xFFFD6585),
      c2: Color(0xFF0D25B9),
      description:
          '🔴 Best for crimson cobalts in bold contrasts, striking and dual-toned.',
    ),
    AppGradient(
      id: 'coral_gold',
      name: 'Coral Gold',
      c1: Color(0xFFFD6E6A),
      c2: Color(0xFFFFC600),
      description:
          '🪸 Perfect for gold corals in reef designs, tropical and golden.',
    ),
    AppGradient(
      id: 'aqua_depth',
      name: 'Aqua Depth',
      c1: Color(0xFF65FDF0),
      c2: Color(0xFF1D6FA3),
      description:
          '🌊 Great for deep aquas in underwater worlds, profound and deep.',
    ),
    AppGradient(
      id: 'blue_volt',
      name: 'Blue Volt',
      c1: Color(0xFF6B73FF),
      c2: Color(0xFF000DFF),
      description:
          '⚡ Ideal for volt effects or blue energies, charged and electric.',
    ),
    AppGradient(
      id: 'fuchsia_dusk',
      name: 'Fuchsia Dusk',
      c1: Color(0xFFFF7AF5),
      c2: Color(0xFF513162),
      description:
          '🌆 Use for dusk fuchsias in evening palettes, fading and dusky.',
    ),
    AppGradient(
      id: 'lime_sky',
      name: 'Lime Sky',
      c1: Color(0xFFF0FF00),
      c2: Color(0xFF58CFFB),
      description:
          '☁️ Perfect for sky limes in fresh skies, bright and sky-high.',
    ),
    AppGradient(
      id: 'royal_purple',
      name: 'Royal Purple',
      c1: Color(0xFF8B00FF),
      c2: Color(0xFF4B0082),
      description:
          '👑 Luxe for premium badges or royal themes, elegant and regal.',
    ),
    AppGradient(
      id: 'electric_lime',
      name: 'Electric Lime',
      c1: Color(0xFFCCFF00),
      c2: Color(0xFF00FF00),
      description: '⚡ Zesty for gaming HUDs or alerts, high-energy and neon.',
    ),
    AppGradient(
      id: 'coral_teal',
      name: 'Coral Teal',
      c1: Color(0xFFFF6B6B),
      c2: Color(0xFF4ECDC4),
      description: '🌺 Vibrant for tropical CTAs, warm-to-cool balance.',
    ),
    AppGradient(
      id: 'indigo_shift',
      name: 'Indigo Shift',
      c1: Color(0xFF667EEA),
      c2: Color(0xFF764BA2),
      description: '🌙 Smooth for dark mode navs, sophisticated and moody.',
    ),
    AppGradient(
      id: 'pink_burst',
      name: 'Pink Burst',
      c1: Color(0xFFF093FB),
      c2: Color(0xFFF5576C),
      description: '💖 Fun for social icons, playful and feminine.',
    ),
    AppGradient(
      id: 'cyber_blue',
      name: 'Cyber Blue',
      c1: Color(0xFF4FACFE),
      c2: Color(0xFF00F2FE),
      description: '💻 Techy for dashboards, futuristic and crisp.',
    ),
    AppGradient(
      id: 'fresh_green',
      name: 'Fresh Green',
      c1: Color(0xFF43E97B),
      c2: Color(0xFF38F9D7),
      description: '🍃 Eco for sustainability pages, lively and natural.',
    ),
    AppGradient(
      id: 'sunset_pink',
      name: 'Sunset Pink',
      c1: Color(0xFFFA709A),
      c2: Color(0xFFFEE140),
      description: '🌇 Romantic for event invites, dreamy and golden.',
    ),
    AppGradient(
      id: 'pastel_dream',
      name: 'Pastel Dream',
      c1: Color(0xFFA8EDEA),
      c2: Color(0xFFFED6E3),
      description: '☁️ Soft for baby apps, gentle and soothing.',
    ),
    AppGradient(
      id: 'lavender_gold',
      name: 'Lavender Gold',
      c1: Color(0xFFD299C2),
      c2: Color(0xFFFEF9D7),
      description: '🌸 Elegant for luxury branding, warm and purple-tinged.',
    ),
    AppGradient(
      id: 'blush_rose',
      name: 'Blush Rose',
      c1: Color(0xFFFF9A9E),
      c2: Color(0xFFFECFEF),
      description: '💕 Delicate for wedding sites, subtle and rosy.',
    ),
    AppGradient(
      id: 'ice_blue',
      name: 'Ice Blue',
      c1: Color(0xFFA1C4FD),
      c2: Color(0xFFC2E9FB),
      description: '❄️ Cool for winter themes, fresh and icy.',
    ),
    AppGradient(
      id: 'peach_sunset',
      name: 'Peach Sunset',
      c1: Color(0xFFFFECD2),
      c2: Color(0xFFFCB69F),
      description: '🍑 Warm for evening UIs, cozy and peachy.',
    ),
    AppGradient(
      id: 'neon_pink',
      name: 'Neon Pink',
      c1: Color(0xFFF093FB),
      c2: Color(0xFFF5576C),
      description: '🌟 Bold for nightlife apps, glowing and pink.',
    ),
    AppGradient(
      id: 'mint_wave',
      name: 'Mint Wave',
      c1: Color(0xFF84FAB0),
      c2: Color(0xFF8FD3F4),
      description: '🌊 Refreshing for spa sites, minty and wavy.',
    ),
    AppGradient(
      id: 'fiery_orange',
      name: 'Fiery Orange',
      c1: Color(0xFFFF9966),
      c2: Color(0xFFFF5E62),
      description: '🔥 Energetic for sales banners, hot and orange.',
    ),
    AppGradient(
      id: 'golden_lavender',
      name: 'Golden Lavender',
      c1: Color(0xFFD299C2),
      c2: Color(0xFFFEF9D7),
      description: '✨ Magical for fantasy games, golden and lavender.',
    ),
    AppGradient(
      id: 'forest_green',
      name: 'Forest Green',
      c1: Color(0xFFA8E6CF),
      c2: Color(0xFF88D8A3),
      description: '🌲 Earthy for outdoor apps, green and forested.',
    ),
    AppGradient(
      id: 'warm_peach',
      name: 'Warm Peach',
      c1: Color(0xFFFFECD2),
      c2: Color(0xFFFCB69F),
      description: '☀️ Inviting for food blogs, peachy and warm.',
    ),
    AppGradient(
      id: 'vivid_sunset',
      name: 'Vivid Sunset',
      c1: Color(0xFFFA709A),
      c2: Color(0xFFFEE140),
      description: '🌅 Stunning for photo overlays, vivid and sunset-like.',
    ),
  ];

  /// A map for quick access via id.
  static final Map<String, AppGradient> byId = {for (final g in all) g.id: g};

  /// A safe default gradient if nothing is stored or the id is unknown.
  static AppGradient fallback() => all.isNotEmpty
      ? all.first
      : const AppGradient(
          id: 'default',
          name: 'Default',
          c1: Color(0xFF111827),
          c2: Color(0xFF0B1220),
          description: 'Default dark background gradient.',
        );

  /// Retrieves the gradient based on a stored id (or fallback).
  static AppGradient resolve(String? id) {
    if (id == null) return fallback();
    return byId[id] ?? fallback();
  }
}

