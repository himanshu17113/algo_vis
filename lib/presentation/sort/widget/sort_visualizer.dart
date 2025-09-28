import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../providers/sort/sort_provider.dart';
import 'sort_widget.dart';

class SortVisualizer<T extends SortProvider> extends StatelessWidget {
  const SortVisualizer({super.key, this.blockSize = 100, required this.width});

  final double blockSize;
  final double width;

  double _getHeight(double width, int numOfWidgets) {
    final horizontalFit = width ~/ blockSize;
    final rows = (numOfWidgets / horizontalFit).ceil();
    return rows * blockSize;
  }

  @override
  Widget build(BuildContext context) {
    final provider = GetIt.I.get<T>();
    final numbers = provider.numbers;
    return ListenableBuilder(
      listenable: provider,
      builder: (context, child) => SizedBox(
        width: width,
        height: _getHeight(width, numbers.length),
        child: Stack(
          children: <Widget>[
            for (var i = 0; i < numbers.length; i++)
              SortWidget(key: numbers[i].key, number: numbers[i], index: i, widgetSize: blockSize, containerWidth: width),
          ],
        ),
      ),
    );
    // child:
  }
}
