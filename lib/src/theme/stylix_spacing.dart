import 'package:flutter/widgets.dart';

class AppSpacing {
  AppSpacing._();

  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double xxxl = 40.0;
  static const double huge = 48.0;
}

class StylixInsets {
  StylixInsets._();

  static const EdgeInsets zero = EdgeInsets.zero;

  static const EdgeInsets xxs = EdgeInsets.all(AppSpacing.xxs);
  static const EdgeInsets xs = EdgeInsets.all(AppSpacing.xs);
  static const EdgeInsets sm = EdgeInsets.all(AppSpacing.sm);
  static const EdgeInsets md = EdgeInsets.all(AppSpacing.md);
  static const EdgeInsets lg = EdgeInsets.all(AppSpacing.lg);
  static const EdgeInsets xl = EdgeInsets.all(AppSpacing.xl);
  static const EdgeInsets xxl = EdgeInsets.all(AppSpacing.xxl);

  static const EdgeInsets horizontalXs = EdgeInsets.symmetric(
    horizontal: AppSpacing.xs,
  );
  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(
    horizontal: AppSpacing.sm,
  );
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
  );
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(
    horizontal: AppSpacing.lg,
  );
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(
    horizontal: AppSpacing.xl,
  );

  static const EdgeInsets verticalXs = EdgeInsets.symmetric(
    vertical: AppSpacing.xs,
  );
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(
    vertical: AppSpacing.sm,
  );
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(
    vertical: AppSpacing.md,
  );
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(
    vertical: AppSpacing.lg,
  );
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(
    vertical: AppSpacing.xl,
  );

  static const EdgeInsets screenPadding = EdgeInsets.all(AppSpacing.lg);
  static const EdgeInsets cardPadding = EdgeInsets.all(AppSpacing.lg);
  static const EdgeInsets dialogPadding = EdgeInsets.all(AppSpacing.xl);
  static const EdgeInsets inputContentPadding = EdgeInsets.symmetric(
    horizontal: AppSpacing.lg,
    vertical: AppSpacing.md,
  );
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: AppSpacing.lg,
    vertical: AppSpacing.md,
  );
  static const EdgeInsets chipPadding = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
    vertical: AppSpacing.sm,
  );
}

class AppGap {
  AppGap._();

  static const Widget hXxs = SizedBox(height: AppSpacing.xxs);
  static const Widget hXs = SizedBox(height: AppSpacing.xs);
  static const Widget hSm = SizedBox(height: AppSpacing.sm);
  static const Widget hMd = SizedBox(height: AppSpacing.md);
  static const Widget hLg = SizedBox(height: AppSpacing.lg);
  static const Widget hXl = SizedBox(height: AppSpacing.xl);
  static const Widget hXxl = SizedBox(height: AppSpacing.xxl);
  static const Widget hXxxl = SizedBox(height: AppSpacing.xxxl);

  static const Widget wXxs = SizedBox(width: AppSpacing.xxs);
  static const Widget wXs = SizedBox(width: AppSpacing.xs);
  static const Widget wSm = SizedBox(width: AppSpacing.sm);
  static const Widget wMd = SizedBox(width: AppSpacing.md);
  static const Widget wLg = SizedBox(width: AppSpacing.lg);
  static const Widget wXl = SizedBox(width: AppSpacing.xl);
  static const Widget wXxl = SizedBox(width: AppSpacing.xxl);
  static const Widget wXxxl = SizedBox(width: AppSpacing.xxxl);
}
