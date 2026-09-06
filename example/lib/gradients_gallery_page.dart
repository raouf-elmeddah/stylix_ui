import 'package:flutter/material.dart';
import 'package:stylix_ui/stylix_ui.dart';

class GradientsGalleryPage extends StatefulWidget {
  final int selectedIndex;

  const GradientsGalleryPage({super.key, this.selectedIndex = 0});

  @override
  State<GradientsGalleryPage> createState() => _GradientsGalleryPageState();
}

class _GradientsGalleryPageState extends State<GradientsGalleryPage> {
  final TextEditingController _jumpController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  late int _selectedIndex;
  late final int _totalCount;

  static const double _spacing = 12;
  static const double _padding = 12;
  static const double _childAspectRatio = 0.9;

  @override
  void initState() {
    super.initState();
    _totalCount = AppGradients.all.length;
    _selectedIndex = widget.selectedIndex.clamp(0, _totalCount - 1);
    _jumpController.text = _selectedIndex.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToIndex(_selectedIndex, animated: false);
    });
  }

  @override
  void dispose() {
    _jumpController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  int _getCrossAxisCount(double width) {
    if (width >= 1400) return 6;
    if (width >= 1100) return 5;
    if (width >= 850) return 4;
    if (width >= 600) return 3;
    return 2;
  }

  void _scrollToIndex(int index, {bool animated = true}) {
    if (!_scrollController.hasClients) return;

    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = _getCrossAxisCount(width);

    final usableWidth = width - (_padding * 2);
    final itemWidth =
        (usableWidth - (_spacing * (crossAxisCount - 1))) / crossAxisCount;
    final itemHeight = itemWidth / _childAspectRatio;

    final row = index ~/ crossAxisCount;
    final offset = row * (itemHeight + _spacing);

    final target = offset.clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    if (animated) {
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _scrollController.jumpTo(target);
    }
  }

  void _jumpToTypedIndex() {
    final parsed = int.tryParse(_jumpController.text.trim());
    if (parsed == null) return;

    final safeIndex = parsed.clamp(0, _totalCount - 1);
    setState(() {
      _selectedIndex = safeIndex;
      _jumpController.text = safeIndex.toString();
    });
    _scrollToIndex(safeIndex);
  }

  @override
  Widget build(BuildContext context) {
    final gradients = AppGradients.all;
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = _getCrossAxisCount(width);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gradients Gallery (${gradients.length})'),
        actions: [
          IconButton(
            tooltip: 'Go to selected',
            onPressed: () => _scrollToIndex(_selectedIndex),
            icon: const Icon(Icons.my_location),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _jumpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jump to gradient index',
                      hintText: '0 - ${gradients.length - 1}',
                      border: const OutlineInputBorder(),
                      isDense: true,
                      suffixIcon: IconButton(
                        onPressed: _jumpToTypedIndex,
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ),
                    onSubmitted: (_) => _jumpToTypedIndex(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Selected index: $_selectedIndex',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(_padding),
              itemCount: gradients.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: _spacing,
                mainAxisSpacing: _spacing,
                childAspectRatio: _childAspectRatio,
              ),
              itemBuilder: (context, index) {
                final isSelected = index == _selectedIndex;

                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                      _jumpController.text = index.toString();
                    });
                    Navigator.pop(context, index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    decoration: BoxDecoration(
                      gradient: gradients[index].linear,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.25),
                        width: isSelected ? 3 : 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: isSelected ? 0.22 : 0.10,
                          ),
                          blurRadius: isSelected ? 14 : 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        if (isSelected)
                          const Positioned(
                            top: 10,
                            right: 10,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.check,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.35),
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              'Gradient $index',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

