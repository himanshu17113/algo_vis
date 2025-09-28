import 'package:flutter/material.dart';
import '../../../model/sort_model.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({required this.number, required this.index, required this.widgetSize, required this.containerWidth, super.key})
    : assert(index >= 0 && widgetSize > 30);

  final SortModel number;
  final int index;
  final double widgetSize;
  final double containerWidth;

  Offset _getPosition(double width) {
    final horizontalFit = width ~/ widgetSize;
    final leftOver = width - (horizontalFit * widgetSize);
    final verticalIndex = index ~/ horizontalFit;
    final horizontalIndex = index % horizontalFit;
    return Offset((widgetSize * horizontalIndex) + leftOver / 2, widgetSize * verticalIndex);
  }

  @override
  Widget build(BuildContext context) {
    final offset = _getPosition(containerWidth);

    var fontSize = 20.0;
    Color backGroundColor = Colors.transparent;
    Color textColor = Theme.of(context).colorScheme.onSurface;
    Color borderColor = Theme.of(context).colorScheme.inverseSurface;

    var borderWidth = 1.0;

    if (number.state == SortState.sort) {
      fontSize = 32;
      backGroundColor = Theme.of(context).colorScheme.primaryContainer;
      textColor = Theme.of(context).colorScheme.onPrimaryContainer;

      borderWidth = 2.0;
    } else if (number.state == SortState.sorted) {
      fontSize = 20;
      borderWidth = 2;
      backGroundColor = Colors.green.withAlpha(20);
      textColor = Colors.green;
      borderColor = Colors.green;
    } else if (number.state == SortState.pivot) {
      fontSize = 28;
      borderWidth = 2;
      backGroundColor = Theme.of(context).colorScheme.tertiaryContainer;
      textColor = Theme.of(context).colorScheme.onTertiaryContainer;
      borderColor = Theme.of(context).colorScheme.tertiary;
    } else if (number.state == SortState.open) {
      fontSize = 20;
      borderWidth = 1;
      backGroundColor = Colors.transparent;
      textColor = Theme.of(context).colorScheme.onSurface;
      borderColor = Theme.of(context).colorScheme.inverseSurface;
    }

    return AnimatedPositioned(
      duration: Durations.extralong4,
      curve: Curves.elasticOut,
      left: offset.dx,
      top: offset.dy,
      child: SizedBox(
        width: widgetSize,
        height: widgetSize,
        child: AnimatedContainer(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8),
          duration: Durations.extralong4,
          curve: Curves.ease,
          decoration: BoxDecoration(
            color: backGroundColor, // Theme.of(context).colorScheme.primaryContainer.withAlpha(((number.value * 1.6) + 55).toInt()),
            border: Border.all(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(number.state == SortState.sort ? 360 : 8),
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            style: TextStyle(color: textColor, fontSize: fontSize),
            child: Text(number.value.toString()),
          ),
        ),
      ),
    );
  }
}
