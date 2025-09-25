import 'package:flutter/material.dart';

const Map<MapEntry<String, IconData>, List<String>> algo = {
  MapEntry("Sorting", Icons.sort): ["Bubble Sort", "Selection Sort", "Insertion Sort", "Merge Sort", "Quick Sort"],
  MapEntry("Searching", Icons.search): ["Linear Search", "Binary Search"],
};
const List<List<Widget>> algoWidgets = [
  [
    // Sorting
    Text("Bubble Sort"),
    Text("Selection Sort"),
    Text("Insertion Sort"),
    Text("Merge Sort"),
    Text("Quick Sort"),
  ],
  [
    // Searching
    Text("Linear Search"),
    Text("Binary Search"),
  ],
];
