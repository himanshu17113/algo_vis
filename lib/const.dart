import 'package:flutter/material.dart';

import 'package:algo_vis/presentation/sort/sort_page.dart';
import 'package:algo_vis/providers/sort/bubble_sort_provider.dart';
import 'package:algo_vis/providers/sort/insertion_sort_provider.dart';
import 'package:algo_vis/providers/sort/quick_sort_provider.dart';
import 'package:algo_vis/providers/sort/selection_sort_provider.dart';

const Map<MapEntry<String, IconData>, List<String>> algo = {
  MapEntry("Sorting", Icons.sort): ["Bubble Sort", "Selection Sort", "Insertion Sort", "Quick Sort"],
  MapEntry("Searching", Icons.search): ["Linear Search", "Binary Search"],
};
const List<List<Widget>> algoWidgets = [
  [
    SortPage<BubbleSortProvider>(title: 'Bubble Sort'),
    SortPage<SelectionSortProvider>(title: 'Selection Sort'),
    SortPage<InsertionSortProvider>(title: 'Insertion Sort'),
    SortPage<QuickSortProvider>(title: 'Quick Sort'),
  ],
  [
    // Searching
    Text("Linear Search"),
    Text("Binary Search"),
  ],
];
