import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../providers/search/search_provider.dart';

class SearchMessage<T extends SearchProvider> extends StatelessWidget {
  const SearchMessage({super.key});

  @override
  Widget build(BuildContext context) {
    double fontSize = 16.0;
    String outputMessage = '';
    Color color = Colors.black;
    return ValueListenableBuilder(
      valueListenable: GetIt.I.get<T>().searchResult,
      builder: (_, state, __) {
        if (state == SearchResult.notFound) {
          outputMessage = 'Value not found';
          fontSize = 24;
          color = Colors.red;
        } else {
          outputMessage = 'Value found';
          fontSize = 24;
          color = Colors.black;
        }
        return Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 6),
          child: Visibility(
            visible: state != SearchResult.none && outputMessage.isNotEmpty,
            child: AnimatedDefaultTextStyle(
              duration: Durations.long1,
              curve: Curves.ease,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: fontSize, color: color),
              child: Text(outputMessage),
            ),
          ),
        );
      },
    );
  }
}
