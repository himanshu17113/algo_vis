import 'dart:developer';

import 'package:algo_vis/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import '../../../../providers/search/search_provider.dart';

class Search<T extends SearchProvider> extends StatelessWidget {
  const Search({super.key});

  static final TextEditingController searchController = TextEditingController();

  void _search() {
    try {
      final val = int.parse(searchController.text);
      GetIt.I<T>().start(val);
    } catch (e) {
      log(e.toString());
    }
  }

  void _reset() {
    searchController.clear();
    GetIt.I<T>().stop();
  }

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        width: 100,
        child: TextField(
          controller: searchController,

          decoration: const InputDecoration(labelText: 'Value', enabledBorder: InputBorder.none),
          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
        ),
      ),
      ValueListenableBuilder(
        valueListenable: GetIt.I<T>().executionState,
        builder: (context, executionState, child) => FilledButton(
          onPressed: executionState != ExecutionState.initial ? _reset : _search,
          child: Text(executionState != ExecutionState.initial ? "Reset" : 'Search', style: TextStyle(color: Colors.white)),
        ),
      ),
    ],
  );
}
