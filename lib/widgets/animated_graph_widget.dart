import 'dart:math';

import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';

class GraphData {
  GraphData({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final int value;
  final Color color;
}

class _AnimatedGraphItem {
  _AnimatedGraphItem({
    required this.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final GlobalKey key;
  final String label;
  int value;
  final Color color;
}

class AnimatedGraphWidget extends StatefulWidget {
  const AnimatedGraphWidget({
    required this.data,
    this.showStats = true,
    this.backgroundColor = const Color(0xFF1A1A2E),
    this.labelFontSize = 14,
    this.valueFontSize = 18,
    super.key,
  });

  final List<GraphData> data;
  final bool showStats;
  final Color backgroundColor;
  final double labelFontSize;
  final double valueFontSize;

  @override
  State<AnimatedGraphWidget> createState() => _AnimatedGraphWidgetState();
}

class _AnimatedGraphWidgetState extends State<AnimatedGraphWidget> {
  late List<_AnimatedGraphItem> _animatedData;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  void didUpdateWidget(AnimatedGraphWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateData();
  }

  void _initializeData() {
    _animatedData = widget.data
        .map(
          (data) => _AnimatedGraphItem(
            key: GlobalObjectKey('graph_item_${data.label}'),
            label: data.label,
            value: data.value,
            color: data.color,
          ),
        )
        .toList();
    // Sort by value (highest first)
    _animatedData.sort((a, b) => b.value.compareTo(a.value));
  }

  void _updateData() {
    setState(() {
      // Update values by matching labels (since order might change after sorting)
      for (final newData in widget.data) {
        try {
          final existingItem = _animatedData.firstWhere(
            (item) => item.label == newData.label,
          );
          existingItem.value = newData.value;
        } catch (e) {
          // Item doesn't exist, add it
          _animatedData.add(
            _AnimatedGraphItem(
              key: GlobalObjectKey('graph_item_${newData.label}'),
              label: newData.label,
              value: newData.value,
              color: newData.color,
            ),
          );
        }
      }
      
      // Remove items that are no longer in the new data
      _animatedData.removeWhere(
        (item) => !widget.data.any((newData) => newData.label == item.label),
      );
      
      // Sort by value (highest first) - this creates the reordering animation
      _animatedData.sort((a, b) => b.value.compareTo(a.value));
    });
  }

  int get _maxValue => _animatedData.isEmpty
      ? 1
      : _animatedData.map((e) => e.value).reduce((a, b) => max(a, b));

  int get _totalValue => _animatedData.fold(0, (sum, item) => sum + item.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: 
          // Graph content
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stats panel
                if (widget.showStats) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F3460).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.blue[400]?.withValues(alpha: 0.5) ??
                            Colors.blue,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _StatItem(
                          label: 'Total',
                          value: _totalValue.toString(),
                          icon: Icons.people,
                        ),
                        const SizedBox(width: 24),
                        _StatItem(
                          label: 'Max',
                          value: _maxValue.toString(),
                          icon: Icons.arrow_upward_rounded,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
                // Graph
                Expanded(
                  child: Row(
                    children: [
                      // Y-axis
                      Container(
                        width: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue[400] ?? Colors.blue,
                              Colors.blue[400]?.withValues(alpha: 0.5) ??
                                  Colors.blue.withValues(alpha: 0.5),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      // Bars
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < _animatedData.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: AnimatedTo.spring(
                                  globalKey: _animatedData[i].key,
                                  child: _Bar(
                                    label: _animatedData[i].label,
                                    value: _animatedData[i].value,
                                    maxValue: _maxValue,
                                    color: _animatedData[i].color,
                                    labelFontSize: widget.labelFontSize,
                                    valueFontSize: widget.valueFontSize,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    required this.label,
    required this.value,
    required this.maxValue,
    required this.color,
    required this.labelFontSize,
    required this.valueFontSize,
  });

  final String label;
  final int value;
  final int maxValue;
  final Color color;
  final double labelFontSize;
  final double valueFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.blue[300] ?? Colors.blue,
            fontSize: labelFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = maxValue > 0
                ? (constraints.maxWidth * value / maxValue)
                    .clamp(0.0, constraints.maxWidth)
                : 0.0;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: valueFontSize * 1.67,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withValues(alpha: 0.8),
                    color,
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  value.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: valueFontSize,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue[400]?.withValues(alpha: 0.5) ?? Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.blue[300] ?? Colors.blue,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.blue[300] ?? Colors.blue,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
