// sort_provider.dart
import 'dart:math';
import 'package:flutter/material.dart';
import '../../model/sort_model.dart';
import '../base_provider.dart';

abstract class SortProvider extends BaseAlgorithmProvider {
  List<SortModel> numbers = [];

  SortProvider() {
    generateData();
  }

  // --- IMPLEMENTING ABSTRACT METHODS ---

  @override
  @protected
  void generateData() => numbers = List.generate(18, (_) => SortModel.create(Random().nextInt(100)), growable: false);

  // In SortProvider
  @override
  @protected
  void reset() {
    isCancelled = true;
    for (var i = 0; i < numbers.length; i++) numbers[i] = numbers[i].reset();
    numbers.shuffle();
    state.value = ExecutionState.initial;
    notifyListeners(); // Rebuilds the bars with the new color
  }

  reShuffle() {
    numbers.shuffle();
    state.value = ExecutionState.initial;
    notifyListeners(); // Rebuilds the bars with the new color
  }

  @override
  @protected
  void onAlgorithmCompleted() {
    // This is called automatically by the base class on success.
    markNodesAsSorted(0, numbers.length - 1);
    // We don't call notifyListeners here because the base class does it.
  }

  // --- VISUALIZATION HELPERS (Unchanged) ---
  // All the `markNodeAs...` and `markNodesAs...` methods remain here.
  // ... (paste your existing markNode... methods here)
  @protected
  void markNodeAsNotSorted(int index) {
    numbers[index] = numbers[index].reset();
  }

  @protected
  void markNodesAsNotSorted(int left, int right) {
    if (left < 0 || right > numbers.length - 1 || left > right) {
      return;
    }
    for (var index = left; index <= right; index++) {
      numbers[index] = numbers[index].reset();
    }
  }

  @protected
  void markNodeForSorting(int index) {
    if (index < 0 || index >= numbers.length) {
      return;
    }
    numbers[index] = numbers[index].sort();
  }

  @protected
  void markNodesForSorting(int indexOne, int indexTwo) {
    numbers[indexOne] = numbers[indexOne].sort();
    numbers[indexTwo] = numbers[indexTwo].sort();
  }

  @protected
  void markNodeAsSorted(int index) {
    numbers[index] = numbers[index].sorted();
  }

  @protected
  void markNodesAsSorted(int left, int right) {
    for (var i = left; i <= right; i++) {
      numbers[i] = numbers[i].sorted();
    }
  }

  @protected
  void markNodeAsPivot(int index) {
    numbers[index] = numbers[index].pivot();
  }
}
