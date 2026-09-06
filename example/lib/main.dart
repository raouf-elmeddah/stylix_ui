import 'package:flutter/material.dart';
import 'package:stylix_ui/stylix_ui.dart';
import 'design_system_preview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;
  StylixBrand brand = StylixBrand.defaultBrand;

  void toggleThemeMode() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  void setThemeMode(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  void setBrand(StylixBrand newBrand) {
    setState(() {
      brand = newBrand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylix UI Example',
      themeMode: themeMode,
      theme: StylixTheme.light(brand, locale: const Locale('en', 'US')),
      darkTheme: StylixTheme.dark(brand, locale: const Locale('en', 'US')),
      home: const DesignSystemPreviewPage(),
    );
  }
}
