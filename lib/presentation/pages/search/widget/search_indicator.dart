import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../model/search_model.dart';
import '../../../../providers/base_provider.dart';
import '../../../../providers/search/search_provider.dart';

class SearchIndicator<T extends SearchProvider> extends StatefulWidget {
  const SearchIndicator({super.key, required this.parentKey});
  final GlobalKey parentKey;

  @override
  State<SearchIndicator<T>> createState() => _SearchIndicatorState<T>();
}

class _SearchIndicatorState<T extends SearchProvider> extends State<SearchIndicator<T>> {
  var _position = Offset.zero;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstLayout(context));
    super.initState();
  }

  void afterFirstLayout(BuildContext context) {
    final numbers = GetIt.I<T>().numbers;
    setState(() {
      _position = _getIndicatorOffset(numbers[numbers.length ~/ 2]);
    });
  }

  Offset _getIndicatorOffset(SearchModel number) {
    try {
      final renderBox = number.key.currentContext?.findRenderObject() as RenderBox?;
      final parentBox = widget.parentKey.currentContext?.findRenderObject() as RenderBox?;

      if (renderBox == null || parentBox == null) {
        return Offset.zero;
      }

      // Get the child's global position
      final childPos = renderBox.localToGlobal(Offset.zero);
      // Get the parent's global position
      final parentPos = parentBox.localToGlobal(Offset.zero);

      // Difference = position of child relative to parent
      return childPos - parentPos;
    } catch (e) {
      debugPrint('Error in _getIndicatorOffset: $e');
      return Offset.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = GetIt.I<T>();

    return ListenableBuilder(
      listenable: searchProvider,
      builder: (context, child) {
        for (var number in searchProvider.numbers) {
          if (number.state == SearchState.search || number.state == SearchState.found) {
            _position = _getIndicatorOffset(number);
            break;
          }
        }

        return AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          left: _position.dx,
          top: _position.dy,
          child: Visibility(
            visible: searchProvider.state.value == ExecutionState.running,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(border: Border.all(), borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            ),
          ),
        );
      },
    );
  }
}
