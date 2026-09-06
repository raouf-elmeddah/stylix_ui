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
`Default`, `Jade Canopy`, `Imperial Nova`, `Rouge Synth`, `Midnight Armor`, `Toxic Flora`, `Arctic Forge`, `Skyline Pulse`, `Neon Velvet`, `Violet Alloy`, `Phantom Mint`, `Ember Core`, `Royal Blush`, `Deep Forest`, `Tidal Mist`, `Solar Eclipse`, `Neon Tide`, `Lavender Pulse`.

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
