import 'package:algo_vis/providers/sort/sort_provider.dart';
import 'package:flutter/material.dart';
import 'widget/sort_button.dart';
import 'widget/sort_speed.dart';
import 'widget/sort_visualizer.dart';

class SortPage<T extends SortProvider> extends StatelessWidget {
  const SortPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    int blockSize = 100;
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth > constraints.maxHeight;
        blockSize = isDesktop ? 100 : 75;
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * (isDesktop ? 0.12 : 0.02), vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 12),
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),
                child: Text(title, style: Theme.of(context).textTheme.displaySmall),
              ),

              Container(
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),

                padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 4, vertical: isDesktop ? 48 : 6),
                margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 4),
                child: LayoutBuilder(
                  builder: (context, constraints) => SortVisualizer<T>(blockSize: blockSize.toDouble(), width: constraints.maxWidth),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),

                padding: const EdgeInsets.all(8),

                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(children: [SortSpeed<T>(), SortButton<T>()]),
              ),
            ],
          ),
        );
      },
    );
    // return
  }
}
