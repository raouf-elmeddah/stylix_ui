import 'package:flutter/material.dart';
import 'main.dart';
import 'package:stylix_ui/stylix_ui.dart';

class DesignSystemPreviewPage extends StatefulWidget {
  const DesignSystemPreviewPage({super.key});

  @override
  State<DesignSystemPreviewPage> createState() =>
      _DesignSystemPreviewPageState();
}

class _DesignSystemPreviewPageState extends State<DesignSystemPreviewPage> {
  bool switchValue = true;
  bool checkboxValue = true;
  bool useDarkPreview = true;
  double sliderValue = 40;
  int selectedNavIndex = 0;
  String selectedRole = 'admin';

  final TextEditingController nameController = TextEditingController(
    text: 'Ayasoft',
  );
  final TextEditingController emailController = TextEditingController(
    text: 'hello@example.com',
  );
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.stylixColors;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: c.background,
      appBar: AppBar(
        title: Text(
          isDark
              ? 'Design System Preview · Dark'
              : 'Design System Preview · Light',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: StylixSpacing.sm),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: c.surfaceContainer,
                borderRadius: StylixCorners.md,
                border: Border.all(color: c.border),
              ),
              child: IconButton(
                tooltip:
                    isDark ? 'Switch to light mode' : 'Switch to dark mode',
                onPressed: () {
                  MyApp.of(context).toggleThemeMode();
                },
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) =>
                      RotationTransition(turns: animation, child: child),
                  child: Icon(
                    isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    key: ValueKey(isDark),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedNavIndex,
        onDestinationSelected: (index) {
          setState(() => selectedNavIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view_rounded),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: c.accent,
        foregroundColor: c.onAccent,
        icon: const Icon(Icons.add),
        label: const Text('New'),
      ),
      body: ListView(
        padding: StylixInsets.screenPadding,
        children: [
          _sectionTitle(context, 'Overview'),
          _overviewBanner(context, c),
          _sectionTitle(context, 'Theme Controls'),
          _demoCard(
            c,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active brand',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: c.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                StylixGap.hMd,
                DropdownButtonFormField<StylixBrand>(
                  initialValue: MyApp.of(context).brand,
                  decoration: const InputDecoration(
                    labelText: 'Brand preset',
                    hintText: 'Choose a color combination',
                  ),
                  items: StylixBrand.values.map((brand) {
                    return DropdownMenuItem<StylixBrand>(
                      value: brand,
                      child: Text(brand.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    MyApp.of(context).setBrand(value);
                  },
                ),
                StylixGap.hLg,
                SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment<ThemeMode>(
                      value: ThemeMode.light,
                      label: Text('Light'),
                      icon: Icon(Icons.light_mode_outlined),
                    ),
                    ButtonSegment<ThemeMode>(
                      value: ThemeMode.dark,
                      label: Text('Dark'),
                      icon: Icon(Icons.dark_mode_outlined),
                    ),
                    ButtonSegment<ThemeMode>(
                      value: ThemeMode.system,
                      label: Text('System'),
                      icon: Icon(Icons.settings_suggest_outlined),
                    ),
                  ],
                  selected: {MyApp.of(context).themeMode},
                  onSelectionChanged: (selection) {
                    MyApp.of(context).setThemeMode(selection.first);
                  },
                ),
              ],
            ),
          ),
          _sectionTitle(context, 'Color Roles'),
          _colorTile(
            label: 'Background',
            color: c.background,
            textColor: c.textPrimary,
            subtitle: 'App scaffold background',
          ),
          _colorTile(
            label: 'Surface',
            color: c.surface,
            textColor: c.textPrimary,
            subtitle: 'Primary surface for sections',
            borderColor: c.border,
          ),
          _colorTile(
            label: 'Surface Container',
            color: c.surfaceContainer,
            textColor: c.textPrimary,
            subtitle: 'Cards, inputs, grouped content',
          ),
          _colorTile(
            label: 'Surface Container High',
            color: c.surfaceContainerHigh,
            textColor: c.textPrimary,
            subtitle: 'Raised or emphasized containers',
          ),
          _colorTile(
            label: 'Primary',
            color: c.primary,
            textColor: c.onPrimary,
            subtitle: 'Main actions and emphasis',
          ),
          _colorTile(
            label: 'Accent',
            color: c.accent,
            textColor: c.onAccent,
            subtitle: 'Secondary emphasis / CTA',
          ),
          _sectionTitle(context, 'Typography'),
          _demoCard(
            c,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Text Primary',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: c.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                StylixGap.hSm,
                Text(
                  'This paragraph uses textSecondary and simulates body content inside a regular card or section.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: c.textSecondary,
                  ),
                ),
                StylixGap.hSm,
                Text(
                  'Muted helper text appears here for hints, metadata, and less important details.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: c.textMuted,
                  ),
                ),
              ],
            ),
          ),
          _sectionTitle(context, 'Buttons'),
          _demoCard(
            c,
            child: Wrap(
              spacing: StylixSpacing.md,
              runSpacing: StylixSpacing.md,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: AppButtonStyles.primary(c, theme.textTheme),
                  child: const Text('Primary Button'),
                ),
                FilledButton(
                  onPressed: () {},
                  style: AppButtonStyles.accent(c, theme.textTheme),
                  child: const Text('Accent Button'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: AppButtonStyles.outline(c, theme.textTheme),
                  child: const Text('Outlined Button'),
                ),
                TextButton(
                  onPressed: () {},
                  style: AppButtonStyles.text(c, theme.textTheme),
                  child: const Text('Text Button'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: AppButtonStyles.primary(c, theme.textTheme),
                  icon: const Icon(Icons.download_rounded),
                  label: const Text('With Icon'),
                ),
              ],
            ),
          ),
          _sectionTitle(context, 'Inputs'),
          _demoCard(
            c,
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    hintText: 'Type to search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                StylixGap.hLg,
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full name',
                    hintText: 'Enter your full name',
                  ),
                ),
                StylixGap.hLg,
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email address',
                    hintText: 'name@example.com',
                    suffixIcon: Icon(Icons.mail_outline_rounded),
                  ),
                ),
                StylixGap.hLg,
                const TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Notes',
                    hintText: 'Write additional notes here',
                    alignLabelWithHint: true,
                  ),
                ),
              ],
            ),
          ),
          _sectionTitle(context, 'Selection Controls'),
          _demoCard(
            c,
            child: Column(
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Enable notifications'),
                  subtitle: const Text(
                    'Tests switch colors and text hierarchy',
                  ),
                  value: switchValue,
                  onChanged: (value) {
                    setState(() => switchValue = value);
                  },
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Remember me'),
                  subtitle: const Text('Tests checkbox inside list tile'),
                  value: checkboxValue,
                  onChanged: (value) {
                    setState(() => checkboxValue = value ?? false);
                  },
                ),
                RadioGroup<String>(
                  groupValue: selectedRole,
                  onChanged: (String? value) {
                    if (value == null) return;
                    setState(() => selectedRole = value);
                  },
                  child: Column(
                    children: const [
                      RadioListTile<String>(
                        contentPadding: EdgeInsets.zero,
                        title: Text('Admin'),
                        subtitle: Text('Primary administrative role'),
                        value: 'admin',
                      ),
                      RadioListTile<String>(
                        contentPadding: EdgeInsets.zero,
                        title: Text('Editor'),
                        subtitle: Text('Content editing permissions'),
                        value: 'editor',
                      ),
                      RadioListTile<String>(
                        contentPadding: EdgeInsets.zero,
                        title: Text('Viewer'),
                        subtitle: Text('Read-only access'),
                        value: 'viewer',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _sectionTitle(context, 'Cards & Lists'),
          _demoCard(
            c,
            child: Column(
              children: [
                _listItem(
                  c,
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Account Balance',
                  subtitle: 'Primary card/list pattern',
                  trailing: '\$12,480',
                ),
                Divider(color: c.divider),
                _listItem(
                  c,
                  icon: Icons.receipt_long_outlined,
                  title: 'Recent Invoice',
                  subtitle: 'Secondary row styling',
                  trailing: 'Paid',
                ),
                Divider(color: c.divider),
                _listItem(
                  c,
                  icon: Icons.support_agent_outlined,
                  title: 'Support Request',
                  subtitle: 'Pending review by admin team',
                  trailing: 'Open',
                ),
              ],
            ),
          ),
          _sectionTitle(context, 'Chips'),
          _demoCard(
            c,
            child: Wrap(
              spacing: StylixSpacing.sm + StylixSpacing.xs,
              runSpacing: StylixSpacing.sm + StylixSpacing.xs,
              children: [
                Chip(
                  label: const Text('Default'),
                  avatar: const Icon(Icons.circle, size: 14),
                ),
                Chip(
                  label: const Text('Accent'),
                  backgroundColor: c.accent.withValues(alpha: .16),
                  side: BorderSide(color: c.accent.withValues(alpha: .35)),
                ),
                InputChip(
                  label: const Text('Selected'),
                  selected: true,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: const Text('Filter'),
                  selected: true,
                  onSelected: (_) {},
                ),
                ActionChip(label: const Text('Action'), onPressed: () {}),
              ],
            ),
          ),
          _sectionTitle(context, 'Semantic States'),
          _statusBanner(
            bg: c.successContainer,
            fg: c.success,
            title: 'Success',
            message: 'Operation completed successfully.',
            icon: Icons.check_circle_outline_rounded,
          ),
          StylixGap.hMd,
          _statusBanner(
            bg: c.warningContainer,
            fg: c.warning,
            title: 'Warning',
            message: 'Please review highlighted fields before continuing.',
            icon: Icons.warning_amber_rounded,
          ),
          StylixGap.hMd,
          _statusBanner(
            bg: c.infoContainer,
            fg: c.info,
            title: 'Info',
            message: 'New update available for your workspace.',
            icon: Icons.info_outline_rounded,
          ),
          StylixGap.hMd,
          _statusBanner(
            bg: c.errorContainer,
            fg: c.error,
            title: 'Error',
            message: 'Something went wrong while processing the request.',
            icon: Icons.error_outline_rounded,
          ),
          _sectionTitle(context, 'Progress & Metrics'),
          _demoCard(
            c,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Storage usage',
                  style: TextStyle(
                    color: c.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                StylixGap.hSm,
                LinearProgressIndicator(
                  value: 0.68,
                  backgroundColor: c.surfaceContainerHigh,
                  color: c.primary,
                  minHeight: 10,
                  borderRadius: StylixCorners.pill,
                ),
                StylixGap.hXl,
                Text(
                  'Team performance',
                  style: TextStyle(
                    color: c.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                StylixGap.hSm,
                Slider(
                  value: sliderValue,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: sliderValue.round().toString(),
                  onChanged: (value) {
                    setState(() => sliderValue = value);
                  },
                ),
              ],
            ),
          ),
          _sectionTitle(context, 'Badges / Small Indicators'),
          _demoCard(
            c,
            child: Wrap(
              spacing: StylixSpacing.sm + StylixSpacing.xs,
              runSpacing: StylixSpacing.sm + StylixSpacing.xs,
              children: [
                _badge('Primary', c.primary, c.onPrimary),
                _badge('Accent', c.accent, c.onAccent),
                _badge('Success', c.successContainer, c.success),
                _badge('Warning', c.warningContainer, c.warning),
                _badge('Info', c.infoContainer, c.info),
                _badge('Error', c.errorContainer, c.error),
              ],
            ),
          ),
          _sectionTitle(context, 'Dialog Preview'),
          _demoCard(
            c,
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _showPreviewDialog(context),
                    style: AppButtonStyles.outline(c, theme.textTheme),
                    child: const Text('Show Dialog'),
                  ),
                ),
                StylixGap.wMd,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _showSnack(context),
                    style: AppButtonStyles.primary(c, theme.textTheme),
                    child: const Text('Show Snackbar'),
                  ),
                ),
              ],
            ),
          ),
          _sectionTitle(context, 'Dark Preview'),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Show embedded dark preview'),
            subtitle: const Text('Useful for checking both modes in one page'),
            value: useDarkPreview,
            onChanged: (value) {
              setState(() => useDarkPreview = value);
            },
          ),
          if (useDarkPreview) ...[StylixGap.hSm, _darkPreviewBlock()],
          StylixGap.hXxxl,
        ],
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    final c = context.stylixColors;

    return Padding(
      padding: const EdgeInsets.only(
          top: StylixSpacing.xl, bottom: StylixSpacing.md),
      child: Text(
        title,
        style: TextStyle(
          color: c.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _overviewBanner(BuildContext context, StylixThemeColors c) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: AppCardStyles.padding,
      decoration: AppCardStyles.muted(
        c,
      ).copyWith(borderRadius: StylixCorners.xl),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: c.primary,
              borderRadius: StylixCorners.lg,
            ),
            child: Icon(
              isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
              color: c.onPrimary,
            ),
          ),
          StylixGap.wLg,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Design token preview',
                  style: TextStyle(
                    color: c.textPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                StylixGap.hXs,
                Text(
                  'Use this screen to validate colors, contrast, and component states before applying them across the app.',
                  style: TextStyle(color: c.textSecondary, height: 1.35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorTile({
    required String label,
    required Color color,
    required Color textColor,
    required String subtitle,
    Color? borderColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: StylixSpacing.md),
      padding: AppCardStyles.padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: StylixCorners.xl,
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          StylixGap.hXs,
          Text(
            subtitle,
            style: TextStyle(color: textColor.withValues(alpha: .8)),
          ),
        ],
      ),
    );
  }

  Widget _demoCard(StylixThemeColors c, {required Widget child}) {
    return Container(
      width: double.infinity,
      padding: AppCardStyles.padding,
      decoration: AppCardStyles.surface(c),
      child: child,
    );
  }

  Widget _listItem(
    StylixThemeColors c, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String trailing,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: c.surfaceContainerHigh,
          borderRadius: StylixCorners.md,
        ),
        child: Icon(icon, color: c.primary),
      ),
      title: Text(
        title,
        style: TextStyle(color: c.textPrimary, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle, style: TextStyle(color: c.textSecondary)),
      trailing: Text(
        trailing,
        style: TextStyle(color: c.textPrimary, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _statusBanner({
    required Color bg,
    required Color fg,
    required String title,
    required String message,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(StylixSpacing.md),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: StylixCorners.xl,
        border: Border.all(color: fg.withValues(alpha: .35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: fg),
          StylixGap.wMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: fg, fontWeight: FontWeight.w700),
                ),
                StylixGap.hXs,
                Text(
                  message,
                  style: TextStyle(
                    color: fg.withValues(alpha: .9),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _badge(String label, Color bg, Color fg) {
    return Container(
      padding: StylixInsets.chipPadding,
      decoration: BoxDecoration(color: bg, borderRadius: StylixCorners.pill),
      child: Text(
        label,
        style: TextStyle(color: fg, fontWeight: FontWeight.w600),
      ),
    );
  }

  Future<void> _showPreviewDialog(BuildContext context) {
    final c = context.stylixColors;
    final theme = Theme.of(context);

    return showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: c.card,
          shape: const RoundedRectangleBorder(borderRadius: StylixCorners.xl),
          title: Text('Dialog Preview', style: TextStyle(color: c.textPrimary)),
          content: Text(
            'This dialog helps you verify surface, text, action, and border behavior.',
            style: TextStyle(color: c.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: AppButtonStyles.text(c, theme.textTheme),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: AppButtonStyles.primary(c, theme.textTheme),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showSnack(BuildContext context) {
    final c = context.stylixColors;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: c.surfaceContainerHigh,
        behavior: SnackBarBehavior.floating,
        content: Text(
          'This is a snackbar preview.',
          style: TextStyle(color: c.textPrimary),
        ),
      ),
    );
  }

  Widget _darkPreviewBlock() {
    const background = Color(0xFF162331);
    const surface = Color(0xFF1B2B3A);
    const surfaceContainer = Color(0xFF223447);
    const border = Color(0xFF395066);
    const textPrimary = Color(0xFFFEFEFE);
    const textSecondary = Color(0xFFD3DAE1);
    const primary = Color(0xFFDCE6EF);
    const onPrimary = Color(0xFF21364C);
    const accent = Color(0xFFF18420);
    const onAccent = Color(0xFF2A1703);
    const success = Color(0xFF239B56);
    const successBg = Color(0x33239B56);

    return Container(
      padding: StylixInsets.cardPadding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: StylixCorners.xxl,
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dark mode preview',
            style: TextStyle(
              color: textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          StylixGap.hLg,
          Container(
            padding: const EdgeInsets.all(StylixSpacing.md),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: StylixCorners.xl,
              border: Border.all(color: border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Analytics Card',
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                StylixGap.hXs,
                const Text(
                  'Quick embedded preview for dark surfaces and typography.',
                  style: TextStyle(color: textSecondary, height: 1.35),
                ),
                StylixGap.hLg,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: onPrimary,
                          padding: StylixInsets.buttonPadding,
                          shape: const RoundedRectangleBorder(
                            borderRadius: StylixCorners.lg,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Primary'),
                      ),
                    ),
                    StylixGap.wSm,
                    Expanded(
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: accent,
                          foregroundColor: onAccent,
                          padding: StylixInsets.buttonPadding,
                          shape: const RoundedRectangleBorder(
                            borderRadius: StylixCorners.lg,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Accent'),
                      ),
                    ),
                  ],
                ),
                StylixGap.hMd,
                Container(
                  padding: const EdgeInsets.all(StylixSpacing.md),
                  decoration: BoxDecoration(
                    color: successBg,
                    borderRadius: StylixCorners.lg,
                    border: Border.all(color: success.withValues(alpha: .35)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.check_circle_outline, color: success),
                      SizedBox(width: StylixSpacing.sm + StylixSpacing.xs),
                      Expanded(
                        child: Text(
                          'Everything looks good in dark mode too.',
                          style: TextStyle(color: textPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
                StylixGap.hMd,
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: surfaceContainer,
                    borderRadius: StylixCorners.lg,
                    border: Border.all(color: border),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: StylixSpacing.md,
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Input preview',
                    style: TextStyle(color: textSecondary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
