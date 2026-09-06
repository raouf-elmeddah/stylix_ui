import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stylix_ui/stylix_ui.dart';

void main() {
  group('StylixBrandPresets', () {
    test('resolves default brand correctly', () {
      final colors = StylixBrandPresets.resolve(StylixBrand.defaultBrand);
      expect(colors.primary, isNotNull);
      expect(colors.accent, isNotNull);
    });

    test('resolves jadeCanopy brand correctly', () {
      final colors = StylixBrandPresets.resolve(StylixBrand.jadeCanopy);
      expect(colors.primary, const Color(0xFF1F4D3A));
    });
  });

  group('StylixTheme', () {
    test('generates light theme with extensions', () {
      final theme = StylixTheme.light(StylixBrand.defaultBrand, locale: const Locale('en', 'US'));
      expect(theme.brightness, Brightness.light);
      
      final extension = theme.extension<StylixColorsExtension>();
      expect(extension, isNotNull);
      expect(extension!.colors.background, isNotNull);
    });

    test('generates dark theme with extensions', () {
      final theme = StylixTheme.dark(StylixBrand.midnightArmor, locale: const Locale('en', 'US'));
      expect(theme.brightness, Brightness.dark);
      
      final extension = theme.extension<StylixColorsExtension>();
      expect(extension, isNotNull);
    });
  });

  group('BuildContext Extensions', () {
    testWidgets('provides stylixColors', (WidgetTester tester) async {
      late StylixThemeColors resolvedColors;

      await tester.pumpWidget(
        MaterialApp(
          theme: StylixTheme.light(StylixBrand.defaultBrand, locale: const Locale('en', 'US')),
          home: Builder(
            builder: (context) {
              resolvedColors = context.stylixColors;
              return Container();
            },
          ),
        ),
      );

      expect(resolvedColors, isNotNull);
    });
  });
}
