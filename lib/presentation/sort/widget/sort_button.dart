import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:algo_vis/providers/sort/sort_provider.dart';

import '../../../providers/base_provider.dart';

class SortButton<T extends SortProvider> extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = GetIt.I.get<T>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder<ExecutionState>(
        valueListenable: provider.state,
        builder: (context, status, child) {
          switch (status) {
            case ExecutionState.running:
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  FilledButton.tonal(onPressed: () => provider.pause(), child: const Text('Pause')),
                  FilledButton.tonal(onPressed: () => provider.onReset(), child: const Text('Reset')),
                ],
              );
            case ExecutionState.paused:
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  FilledButton.tonal(onPressed: () => provider.resume(), child: const Text('Resume')),
                  FilledButton.tonal(onPressed: () => provider.onReset(), child: const Text('Reset')),
                ],
              );
            case ExecutionState.completed:
              return FilledButton.tonal(onPressed: () => provider.onReset(), child: const Text('Reset'));

            case ExecutionState.initial:
              return Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton.tonal(onPressed: () => provider.start(), child: const Text('Sort')),
                  FilledButton.tonal(onPressed: () => provider.reShuffle(), child: const Text('Re Shuffle')),
                ],
              );
          }
        },
      ),
    );
  }
}
