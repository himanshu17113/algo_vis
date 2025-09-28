import 'dart:math';

import 'package:flutter/material.dart';

import '../../model/search_model.dart';
import '../base_provider.dart';


// Enum for specific search outcomes
enum SearchResult { none, found, notFound }

class SearchProvider extends ExecutionProvider {
  // --- SEARCH-SPECIFIC STATE ---
  final ValueNotifier<SearchResult> searchResult =
      ValueNotifier(SearchResult.none);
  int? foundIndex;
  late int _targetValue;

  List<SearchModel> numbers = List.generate(
      20, (index) => SearchModel.initial((index * 3 + Random().nextInt(3)).toInt()));

  // --- PUBLIC ENTRY POINT ---

  /// Sets the target value and starts the search execution.
  void search({required int value}) {
    _targetValue = value;
    start(); // Calls the start() method from ExecutionProvider
  }

  // --- IMPLEMENTING ABSTRACT METHODS FROM BASE CLASS ---

  @override
  Future<void> onExecute() async {
    // This is where the actual algorithm logic goes.
    var left = 0;
    var right = numbers.length - 1;

    while (left <= right) {
      if (isCancelled) return; // Check for cancellation

      var middle = (left + right) ~/ 2;
      potentialNode(middle);
      await wait(); // Use the pausable delay from the base class

      if (isCancelled) return;

      if (numbers[middle].value == _targetValue) {
         foundNode(middle);
        return; // Found the item, exit.
      } else if (numbers[middle].value < _targetValue) {
        discardNodes(left, middle);
        left = middle + 1;
      } else {
        discardNodes(middle, right);
        right = middle - 1;
      }
      await wait();
    }

    // If the loop finishes, the value was not found
    searchResult.value = SearchResult.notFound;
  }

  @override
  void onReset() {
    // Reset all search-specific states
    searchResult.value = SearchResult.none;
    foundIndex = null;
    for (var i = 0; i < numbers.length; i++) {
      numbers[i] = SearchModel.initial(numbers[i].value);
    }
    notifyListeners();
  }
  
  // --- HELPER METHODS FOR VISUALS ---

  void potentialNode(int index) {
    numbers[index] = numbers[index].copyWith(
      state: SearchState.search,
      color: Colors.blue,
    );
    notifyListeners();
  }

  void discardNodes(int start, int end) {
    for (int i = start; i <= end; i++) {
      numbers[i] = numbers[i].copyWith(
        state: SearchState.discard,
        color: Colors.red.withOpacity(0.5),
      );
    }
    notifyListeners();
  }

  void  foundNode(int index) {
    numbers[index] = numbers[index].copyWith(
      state: SearchState.found,
      color: Colors.green,
    );
    foundIndex = index;
    searchResult.value = SearchResult.found;
    notifyListeners();
    // Note: We don't need to set executionState.value = ExecutionState.completed here.
    // The base class's start() method handles that automatically when onExecute() finishes.
  }
}