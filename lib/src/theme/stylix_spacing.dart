import 'package:flutter/widgets.dart';

class StylixSpacing {
  StylixSpacing._();

  static const double none = 0.0;
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

  static const EdgeInsets xxs = EdgeInsets.all(StylixSpacing.xxs);
  static const EdgeInsets xs = EdgeInsets.all(StylixSpacing.xs);
  static const EdgeInsets sm = EdgeInsets.all(StylixSpacing.sm);
  static const EdgeInsets md = EdgeInsets.all(StylixSpacing.md);
  static const EdgeInsets lg = EdgeInsets.all(StylixSpacing.lg);
  static const EdgeInsets xl = EdgeInsets.all(StylixSpacing.xl);
  static const EdgeInsets xxl = EdgeInsets.all(StylixSpacing.xxl);

  static const EdgeInsets horizontalXs = EdgeInsets.symmetric(
    horizontal: StylixSpacing.xs,
  );
  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(
    horizontal: StylixSpacing.sm,
  );
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(
    horizontal: StylixSpacing.md,
  );
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(
    horizontal: StylixSpacing.lg,
  );
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(
    horizontal: StylixSpacing.xl,
  );

  static const EdgeInsets verticalXs = EdgeInsets.symmetric(
    vertical: StylixSpacing.xs,
  );
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(
    vertical: StylixSpacing.sm,
  );
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(
    vertical: StylixSpacing.md,
  );
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(
    vertical: StylixSpacing.lg,
  );
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(
    vertical: StylixSpacing.xl,
  );

  static const EdgeInsets screenPadding = EdgeInsets.all(StylixSpacing.lg);
  static const EdgeInsets cardPadding = EdgeInsets.all(StylixSpacing.lg);
  static const EdgeInsets dialogPadding = EdgeInsets.all(StylixSpacing.xl);
  static const EdgeInsets inputContentPadding = EdgeInsets.symmetric(
    horizontal: StylixSpacing.lg,
    vertical: StylixSpacing.md,
  );
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: StylixSpacing.lg,
    vertical: StylixSpacing.md,
  );
  static const EdgeInsets chipPadding = EdgeInsets.symmetric(
    horizontal: StylixSpacing.md,
    vertical: StylixSpacing.sm,
  );
}

class StylixGap {
  StylixGap._();

  static const Widget hNone = SizedBox.shrink();
  static const Widget hXxs = SizedBox(height: StylixSpacing.xxs);
  static const Widget hXs = SizedBox(height: StylixSpacing.xs);
  static const Widget hSm = SizedBox(height: StylixSpacing.sm);
  static const Widget hMd = SizedBox(height: StylixSpacing.md);
  static const Widget hLg = SizedBox(height: StylixSpacing.lg);
  static const Widget hXl = SizedBox(height: StylixSpacing.xl);
  static const Widget hXxl = SizedBox(height: StylixSpacing.xxl);
  static const Widget hXxxl = SizedBox(height: StylixSpacing.xxxl);

  static const Widget wNone = SizedBox.shrink();
  static const Widget wXxs = SizedBox(width: StylixSpacing.xxs);
  static const Widget wXs = SizedBox(width: StylixSpacing.xs);
  static const Widget wSm = SizedBox(width: StylixSpacing.sm);
  static const Widget wMd = SizedBox(width: StylixSpacing.md);
  static const Widget wLg = SizedBox(width: StylixSpacing.lg);
  static const Widget wXl = SizedBox(width: StylixSpacing.xl);
  static const Widget wXxl = SizedBox(width: StylixSpacing.xxl);
  static const Widget wXxxl = SizedBox(width: StylixSpacing.xxxl);
}
