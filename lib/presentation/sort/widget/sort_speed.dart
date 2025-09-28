import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../providers/sort/sort_provider.dart';

class SortSpeed<T extends SortProvider> extends StatelessWidget {
  const SortSpeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: GetIt.I.get<T>(),
      builder: (context, child) => Slider(value: GetIt.I.get<T>().executionSpeed, onChanged: (value) => GetIt.I.get<T>().executionSpeed = value),
    );
  }
}
