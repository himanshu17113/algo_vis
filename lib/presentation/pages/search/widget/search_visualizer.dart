import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../providers/search/search_provider.dart';
import 'search_widget.dart';

class SearchVisualizer<T extends SearchProvider> extends StatelessWidget {
  const SearchVisualizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6,bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04, vertical: MediaQuery.of(context).size.width * 0.02),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),

      child: ListenableBuilder(
        listenable: GetIt.I<T>(),
        builder: (context, child) {
          final numbers = GetIt.I<T>().numbers;
          return Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[for (var number in numbers) SearchWidget(number: number)],
          );
        },
      ),
    );
  }
}
