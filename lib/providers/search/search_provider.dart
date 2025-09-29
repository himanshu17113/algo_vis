import 'dart:math';

import 'package:flutter/material.dart';

import '../../model/search_model.dart';
import '../base_provider.dart';

// Enum for specific search outcomes
enum SearchResult { none, found, notFound }

abstract class SearchProvider extends ExecutionProvider {
  // --- SEARCH-SPECIFIC STATE ---
  final ValueNotifier<SearchResult> searchResult = ValueNotifier(SearchResult.none);
  int? foundIndex;

  List<SearchModel> numbers = List.generate(35, (index) => SearchModel.initial((index * 3 + Random().nextInt(3)).toInt()));

  // --- PUBLIC ENTRY POINT ---
  @protected
  void search({int value = 34}) {
    if (executionState.value == ExecutionState.running) return; // Prevent starting if already running

    onExecute(value); // Call the base class's start method
  }

  // --- IMPLEMENTING ABSTRACT METHODS FROM BASE CLASS ---

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
  @protected
  void potentialNode(int index) {
    numbers[index] = numbers[index].copyWith(state: SearchState.search, color: Colors.blue);
    notifyListeners();
  }

  void discardNodes(int start, int end) {
    for (int i = start; i <= end; i++) {
      numbers[i] = numbers[i].copyWith(state: SearchState.discard, color: Colors.red.withAlpha(125));
    }
    notifyListeners();
  }

  void discardNode(int index) {
    numbers[index] = numbers[index].copyWith(state: SearchState.discard, color: Colors.red.withAlpha(135));
    notifyListeners();
  }

  @protected
  void searchedNode(int index) {
    numbers[index] = numbers[index].copyWith(state: SearchState.searched);
    notifyListeners();
  }

  @protected
  void foundNode(int index) {
    numbers[index] = numbers[index].copyWith(state: SearchState.found, color: Colors.green);
    foundIndex = index;
    searchResult.value = SearchResult.found;
    notifyListeners();
    // Note: We don't need to set executionState.value = ExecutionState.completed here.
    // The base class's start() method handles that automatically when onExecute() finishes.
  }

  @protected
  nodeNotFound() {
    searchResult.value = SearchResult.notFound;
    notifyListeners();
  }
}
