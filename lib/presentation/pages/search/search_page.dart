import 'package:flutter/material.dart';

import '../../../providers/search/search_provider.dart';
import 'widget/search.dart';
import 'widget/search_indicator.dart';
import 'widget/search_message.dart';
import 'widget/search_speed.dart';
import 'widget/search_visualizer.dart';

class SearchPage<T extends SearchProvider> extends StatelessWidget {
  final String title;
  const SearchPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey(debugLabel: title);
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth > constraints.maxHeight;
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * (isDesktop ? 0.12 : 0), vertical: 16),

          child: Stack(
            key: key,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 6, bottom: 22),
                    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 6),
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),

                    child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
                  ),

                  //Below can not be constant
                  SearchVisualizer<T>(),
                  Card.filled(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    //   padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 12),
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    child: Column(children: [SearchMessage<T>(), SearchSpeed<T>(), Search<T>()]),
                  ),
                ],
              ),
              SearchIndicator<T>(parentKey: key),
            ],
          ),
        );
      },
    );
  }
}
