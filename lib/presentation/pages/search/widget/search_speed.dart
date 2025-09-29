import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../providers/search/search_provider.dart';

class SearchSpeed<T extends SearchProvider> extends StatelessWidget {
  const SearchSpeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: GetIt.I.get<T>(),
      builder: (context, child) => Slider(value: GetIt.I.get<T>().executionSpeed, onChanged: (value) => GetIt.I.get<T>().executionSpeed = value),
    );
  }
}
