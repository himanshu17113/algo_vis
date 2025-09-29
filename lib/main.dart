import 'package:algo_vis/providers/search/binary_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:algo_vis/providers/sort/bubble_sort_provider.dart';
import 'package:algo_vis/providers/sort/insertion_sort_provider.dart';
import 'package:algo_vis/providers/sort/quick_sort_provider.dart';
import 'package:algo_vis/providers/sort/selection_sort_provider.dart';
import 'g_variable.dart';
import 'presentation/pages/home/home.dart';
import 'providers/search/linear_search_provider.dart';

void setupDependencies() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<BinarySearchProvider>(BinarySearchProvider());
  getIt.registerSingleton<LinearSearchProvider>(LinearSearchProvider());
  // Register as singletons (same instance throughout app)
  getIt.registerSingleton<BubbleSortProvider>(BubbleSortProvider());
  getIt.registerSingleton<QuickSortProvider>(QuickSortProvider());
  getIt.registerSingleton<InsertionSortProvider>(InsertionSortProvider());
  getIt.registerSingleton<SelectionSortProvider>(SelectionSortProvider());
  //getIt.registerSingleton<SearchProvider>(SearchProvider());
}

void main() {
  setupDependencies();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSeed colorSelected = ColorSeed.white;
  // Determines if the light theme should be used based on the current ThemeMode.
  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        // Accessing platformBrightness via a context-aware method.
        return View.of(context).platformDispatcher.platformBrightness == Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  // Callback to handle theme brightness changes.
  void handleBrightnessChange({bool useLightMode = true}) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  // Callback to handle color seed changes.
  void handleColorSelect(int value) {
    setState(() {
      colorSelected = ColorSeed.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Algorithm',
      restorationScopeId: 'app',
      themeMode: themeMode,
      // Using a consistent scroll behavior across the app.
      scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
      color: colorSelected.color,
      theme: ThemeData(colorSchemeSeed: colorSelected.color, useMaterial3: true, brightness: Brightness.light),
      // Dark theme definition.
      darkTheme: ThemeData(colorSchemeSeed: colorSelected.color, useMaterial3: true, brightness: Brightness.dark),
      // Setting themeAnimationDuration to zero prevents the default MaterialApp
      // animation from conflicting with our custom AnimateTheme transition.
      themeAnimationDuration: Duration.zero,
      // High contrast themes for accessibility.
      highContrastDarkTheme: ThemeData.from(colorScheme: const ColorScheme.highContrastDark(), useMaterial3: true),
      highContrastTheme: ThemeData.from(colorScheme: const ColorScheme.highContrastLight(), useMaterial3: true),

      home: Home(
        useLightMode: useLightMode,
        colorSelected: colorSelected,
        handleBrightnessChange: handleBrightnessChange,
        handleColorSelect: handleColorSelect,
      ),
    );
  }
}
