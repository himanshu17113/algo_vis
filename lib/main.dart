import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:algo_vis/providers/sort/bubble_sort_provider.dart';
import 'package:algo_vis/providers/sort/insertion_sort_provider.dart';
import 'package:algo_vis/providers/sort/quick_sort_provider.dart';
import 'package:algo_vis/providers/sort/selection_sort_provider.dart';
import 'package:algo_vis/route/route.dart';

void setupDependencies() {
  final getIt = GetIt.instance;

  // Register as singletons (same instance throughout app)
  getIt.registerSingleton<BubbleSortProvider>(BubbleSortProvider());
  getIt.registerSingleton<QuickSortProvider>(QuickSortProvider());
  getIt.registerSingleton<InsertionSortProvider>(InsertionSortProvider());
  getIt.registerSingleton<SelectionSortProvider>(SelectionSortProvider());
}

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Setup GetIt in your main.dart or in a setup file

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Algorithm', initialRoute: Routes.home, routes: Routes.routes);
  }
}
