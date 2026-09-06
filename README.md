# Stylix UI

A highly opinionated, semantic design system and theme package for Flutter. 

`stylix_ui` moves beyond generic Material 3 defaults by implementing a robust, multi-layered design token system. It abstracts away raw colors in favor of semantic meaning, ensures rigorous typographic discipline (using Barlow Condensed/Cairo), and provides a curated collection of bold, distinctive brand presets.

## Features

- **Semantic Tokens:** Stop hardcoding colors like `Colors.grey[300]`. Use `context.stylixColors.surfaceContainerHigh` to ensure perfect light/dark mode transitions and semantic meaning.
- **17 Custom Brand Presets:** From `Arctic Forge` to `Neon Velvet`, switch your app's entire visual identity with a single line of code.
- **Typographic Discipline:** A strict, non-default type scale built on `GoogleFonts` that ensures your app doesn't look like a templated wireframe.
- **Developer Ergonomics:** Extension methods on `BuildContext` make accessing the theme incredibly fast and autocomplete-friendly.

## Installation

Add `stylix_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  stylix_ui:
    path: /path/to/stylix_ui
```

## Quick Start

### 1. Wrap your app in StylixTheme

Inject the theme into your `MaterialApp` using your preferred brand:

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
    // Choose from 17 bold presets
    const brand = StylixBrand.arcticForge;

    return MaterialApp(
      title: 'Stylix App',
      themeMode: ThemeMode.system,
      theme: StylixTheme.light(brand, locale: const Locale('en', 'US')),
      darkTheme: StylixTheme.dark(brand, locale: const Locale('en', 'US')),
      home: const MyHomePage(),
    );
  }
}
```

### 2. Accessing Theme Tokens

Anywhere in your widget tree, you can use the `BuildContext` extension to style your components:

```dart
Container(
  // Use semantic colors instead of raw hex values
  color: context.stylixColors.surfaceContainerHigh,
  child: Text(
    StylixBrand.arcticForge.displayName, // "Arctic Forge"
    style: context.stylixText.titleLarge?.copyWith(
      color: context.stylixColors.textPrimary,
    ),
  ),
)
```

## Available Brands

- Default
- Jade Canopy
- Imperial Nova
- Rouge Synth
- Midnight Armor
- Toxic Flora
- Arctic Forge
- Skyline Pulse
- Neon Velvet
- Violet Alloy
- Phantom Mint
- Ember Core
- Royal Blush
- Deep Forest
- Tidal Mist
- Solar Eclipse
- Neon Tide
- Lavender Pulse

## Example 

Check out the `example/` folder for a comprehensive `DesignSystemPreviewPage` showcasing all tokens, typography, gradients, and components.
