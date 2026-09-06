# 💎 Stylix UI
![Pub Version](https://img.shields.io/pub/v/stylix_ui?color=blue)
![License](https://img.shields.io/github/license/raouf-elmeddah/stylix_ui)
![Flutter](https://img.shields.io/badge/Flutter-%E2%9D%A4-red)

**Stylix UI** is a beautiful, highly-opinionated, and highly-scalable design system for Flutter. It brings together expertly crafted color palettes (brands), pixel-perfect spacing, modern typography, elevation shadows, layout gaps, and fully pre-built component styles (Buttons & Cards). 

Say goodbye to manually tweaking padding and hunting for hex codes. Stylix acts as the unified design language for your entire application.

---

## ✨ Features

- **18 Premium Brand Presets:** Instantly switch your entire app's look and feel with one line of code.
- **Dynamic Light/Dark Modes:** Automatically adapts your brand tokens to perfectly balanced light and dark schemes.
- **Semantic Tokens via Context:** Access colors contextually with `context.stylixColors.background` instead of messy raw colors.
- **Unified Spacing & Gaps:** No more magic numbers. Use `StylixSpacing.md` and `StylixGap.hXl` for consistent layouts.
- **Pre-built Component Styles:** Instantly style Buttons and Cards with `StylixButtonStyles` and `StylixCardStyles`.
- **40+ Premium Gradients:** Access beautifully crafted linear gradients for hero sections, cards, and backgrounds via `StylixGradients`.
- **Premium Typography:** Integrates seamlessly with `GoogleFonts` (Barlow Condensed for English, Cairo for Arabic).

---

## 🚀 Getting Started

### 1. Add Dependency

Add `stylix_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  stylix_ui: ^1.0.3
```

### 2. Initialize the Theme

Wrap your `MaterialApp` with `StylixTheme.light` and `StylixTheme.dark`. 

```dart
import 'package:flutter/material.dart';
import 'package:stylix_ui/stylix_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Pick one of the 18 gorgeous built-in brands!
    const brand = StylixBrand.jadeCanopy;

    return MaterialApp(
      title: 'Stylix Demo',
      themeMode: ThemeMode.system,
      // 2. Inject Stylix into ThemeData
      theme: StylixTheme.light(brand, locale: const Locale('en', 'US')),
      darkTheme: StylixTheme.dark(brand, locale: const Locale('en', 'US')),
      home: const HomePage(),
    );
  }
}
```

---

## 🎨 Core Systems & Code Examples

### 1. Colors & Semantic Tokens
Access your theme's semantic colors from anywhere using the `context.stylixColors` extension. This ensures your app perfectly adapts to light/dark modes automatically.

```dart
Container(
  // Use semantic colors!
  color: context.stylixColors.surfaceContainer,
  child: Text(
    'Hello World',
    style: TextStyle(
      color: context.stylixColors.primary,
    ),
  ),
)
```

### 2. The 18 Brand Presets
Stylix comes with 18 professionally designed brand palettes. You can access them via the `StylixBrand` enum. If you need a readable string for the UI (like a settings dropdown), just use `.displayName`!

```dart
final currentBrand = StylixBrand.neonVelvet;
print(currentBrand.displayName); // "Neon Velvet"
```

**Available Brands:**
<br/>
![Default](https://img.shields.io/badge/-Default-0055FF?style=for-the-badge)
![Jade Canopy](https://img.shields.io/badge/-Jade_Canopy-1F4D3A?style=for-the-badge)
![Imperial Nova](https://img.shields.io/badge/-Imperial_Nova-3A2E7A?style=for-the-badge)
![Rouge Synth](https://img.shields.io/badge/-Rouge_Synth-7A294D?style=for-the-badge)
![Midnight Armor](https://img.shields.io/badge/-Midnight_Armor-1B365D?style=for-the-badge)
![Toxic Flora](https://img.shields.io/badge/-Toxic_Flora-556B2F?style=for-the-badge)
<br/>
![Arctic Forge](https://img.shields.io/badge/-Arctic_Forge-FE2E39?style=for-the-badge)
![Skyline Pulse](https://img.shields.io/badge/-Skyline_Pulse-0239FF?style=for-the-badge)
![Neon Velvet](https://img.shields.io/badge/-Neon_Velvet-2E0F36?style=for-the-badge)
![Violet Alloy](https://img.shields.io/badge/-Violet_Alloy-3E0079?style=for-the-badge)
![Phantom Mint](https://img.shields.io/badge/-Phantom_Mint-050505?style=for-the-badge)
![Ember Core](https://img.shields.io/badge/-Ember_Core-FF902F?style=for-the-badge)
<br/>
![Royal Blush](https://img.shields.io/badge/-Royal_Blush-3447AA?style=for-the-badge)
![Deep Forest](https://img.shields.io/badge/-Deep_Forest-9FE870?style=for-the-badge)
![Tidal Mist](https://img.shields.io/badge/-Tidal_Mist-BDD9D7?style=for-the-badge)
![Solar Eclipse](https://img.shields.io/badge/-Solar_Eclipse-FCDB32?style=for-the-badge)
![Neon Tide](https://img.shields.io/badge/-Neon_Tide-34E0A1?style=for-the-badge)
![Lavender Pulse](https://img.shields.io/badge/-Lavender_Pulse-6260FF?style=for-the-badge)

### 3. Spacing & Gaps (`StylixSpacing` / `StylixGap`)
Stop hardcoding `16.0` and `8.0`. Use the standardized semantic spacing scale.

**Available Spacing Values (`StylixSpacing`):**
`none`, `xxs`, `xs`, `sm`, `md`, `lg`, `xl`, `xxl`, `xxxl`, `huge`

**Available Gaps (`StylixGap`):**
* **Horizontal:** `wNone`, `wXxs`, `wXs`, `wSm`, `wMd`, `wLg`, `wXl`, `wXxl`, `wXxxl`
* **Vertical:** `hNone`, `hXxs`, `hXs`, `hSm`, `hMd`, `hLg`, `hXl`, `hXxl`, `hXxxl`

**Convenience Padding (`StylixInsets`):**
`screenPadding`, `cardPadding`, `dialogPadding`, `buttonPadding`, `chipPadding`, `inputContentPadding`

```dart
// ❌ Bad: Magic Numbers
Padding(
  padding: EdgeInsets.all(16.0),
  child: Column(
    children: [
      Text('Title'),
      SizedBox(height: 24.0),
      Text('Subtitle'),
    ]
  )
)

// ✅ Good: Stylix Semantic Spacing
Padding(
  padding: EdgeInsets.all(StylixSpacing.lg),
  child: Column(
    children: [
      Text('Title'),
      StylixGap.hXl, // Automatically creates a SizedBox with height 24.0
      Text('Subtitle'),
    ]
  )
)
```
*(Note: `StylixSpacing.none` and `StylixGap.hNone` / `wNone` are also available for `0.0` spacing!)*

### 4. Borders & Radius (`StylixRadius` & `StylixCorners`)
Achieve consistent roundness across your entire app using explicit doubles (`StylixRadius`) or pre-built `BorderRadius` objects (`StylixCorners`).

**Available Radius Tokens:**
`none`, `xs`, `sm`, `md`, `lg`, `xl`, `xxl`, `pill`

```dart
Container(
  decoration: BoxDecoration(
    color: context.stylixColors.card,
    // Use pre-built BorderRadius objects!
    borderRadius: StylixCorners.md, 
  ),
)
```

### 5. Elevation & Shadows (`StylixShadows`)
Beautiful, buttery-smooth shadows that look modern, unlike the default harsh Material shadows.

```dart
Container(
  decoration: BoxDecoration(
    color: context.stylixColors.surface,
    boxShadow: StylixShadows.lg(context.stylixColors), // Perfectly tuned shadow
  ),
)
```

### 6. Component Styles (`StylixButtonStyles` & `StylixCardStyles`)
Stylix provides static helpers that instantly generate complex `ButtonStyle` and `BoxDecoration` objects so you don't have to write boilerplate.

**Buttons:**
```dart
ElevatedButton(
  // Instantly applies the primary brand color, correct padding, and hover states!
  style: StylixButtonStyles.primary(context.stylixColors, Theme.of(context).textTheme),
  onPressed: () {},
  child: const Text('Primary Action'),
)

OutlinedButton(
  style: StylixButtonStyles.outline(context.stylixColors, Theme.of(context).textTheme),
  onPressed: () {},
  child: const Text('Secondary Action'),
)
```

**Cards:**
```dart
Container(
  padding: StylixCardStyles.padding, // Standardized 16.0 padding
  decoration: StylixCardStyles.surface(context.stylixColors), // Standard background + border + shadow
  child: const Text('I am a card!'),
)
```

### 7. Gradients (`StylixGradients` & `StylixGradient`)
Need a beautiful background for a splash screen, onboarding, or a premium card? Stylix includes over 40 hand-crafted gradients.

![Sunlit Glow](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/sunlit_glow.png) ![Ocean Breeze](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/ocean_breeze.png) ![Sunset Blush](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/sunset_blush.png) ![Lavender Dream](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/lavender_dream.png) <br/>
![Aqua Splash](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/aqua_splash.png) ![Coral Crush](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/coral_crush.png) ![Emerald Wave](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/emerald_wave.png) ![Pink Lemonade](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/pink_lemonade.png) <br/>
![Mint Fusion](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/mint_fusion.png) ![Violet Haze](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/violet_haze.png) ![Berry Dusk](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/berry_dusk.png) ![Fiery Dawn](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/fiery_dawn.png) <br/>
![Magenta Pulse](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/magenta_pulse.png) ![Neon Sky](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/neon_sky.png) ![Turquoise Tide](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/turquoise_tide.png) ![Peach Glow](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/peach_glow.png) <br/>
![Citrus Sky](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/citrus_sky.png) ![Lime Pop](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/lime_pop.png) ![Golden Night](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/golden_night.png) ![Amber Flame](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/amber_flame.png) <br/>
![Teal Abyss](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/teal_abyss.png) ![Copper Violet](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/copper_violet.png) ![Bubblegum Bliss](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/bubblegum_bliss.png) ![Aqua Indigo](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/aqua_indigo.png) <br/>
![Saffron Plum](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/saffron_plum.png) ![Mustard Twilight](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/mustard_twilight.png) ![Lemon Zest](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/lemon_zest.png) ![Green Sapphire](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/green_sapphire.png) <br/>
![Crimson Flare](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/crimson_flare.png) ![Canary Amethyst](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/canary_amethyst.png) ![Peach Rose](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/peach_rose.png) ![Sky Sapphire](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/sky_sapphire.png) <br/>
![Coral Berry](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/coral_berry.png) ![Mango Magenta](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/mango_magenta.png) ![Mint Cyan](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/mint_cyan.png) ![Midnight Bloom](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/midnight_bloom.png) <br/>
![Lime Burst](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/lime_burst.png) ![Blue Horizon](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/blue_horizon.png) ![Fuchsia Night](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/fuchsia_night.png) ![Teal Blush](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/teal_blush.png) <br/>
![Pink Sunrise](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/pink_sunrise.png) ![Golden Blue](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/golden_blue.png) ![Vivid Plum](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/vivid_plum.png) ![Mint Cobalt](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/mint_cobalt.png) <br/>
![Crimson Cobalt](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/crimson_cobalt.png) ![Coral Gold](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/coral_gold.png) ![Aqua Depth](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/aqua_depth.png) ![Blue Volt](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/blue_volt.png) <br/>
![Fuchsia Dusk](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/fuchsia_dusk.png) ![Lime Sky](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/lime_sky.png) ![Royal Purple](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/royal_purple.png) ![Electric Lime](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/electric_lime.png) <br/>
![Coral Teal](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/coral_teal.png) ![Indigo Shift](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/indigo_shift.png) ![Pink Burst](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/pink_burst.png) ![Cyber Blue](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/cyber_blue.png) <br/>
![Fresh Green](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/fresh_green.png) ![Sunset Pink](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/sunset_pink.png) ![Pastel Dream](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/pastel_dream.png) ![Lavender Gold](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/lavender_gold.png) <br/>
![Blush Rose](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/blush_rose.png) ![Ice Blue](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/ice_blue.png) ![Peach Sunset](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/peach_sunset.png) ![Neon Pink](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/neon_pink.png) <br/>
![Mint Wave](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/mint_wave.png) ![Fiery Orange](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/fiery_orange.png) ![Golden Lavender](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/golden_lavender.png) ![Forest Green](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/forest_green.png) <br/>
![Warm Peach](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/warm_peach.png) ![Vivid Sunset](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/vivid_sunset.png) ![Default](https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/docs/assets/gradients/default.png) <br/>

```dart
Container(
  decoration: BoxDecoration(
    // Access a specific gradient by ID or list
    gradient: StylixGradients.all.first.gradient,
  ),
)
```

---

## 🛠 Example App

Want to see all these tokens, brands, and components in action? Check out the `example/` folder! It includes a full `DesignSystemPreviewPage` that allows you to hot-swap between all 18 brands and instantly see how the spacing, colors, and typography react.
