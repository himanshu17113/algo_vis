import 'package:flutter/material.dart';

import '../../../g_variable.dart';

class ColorSeedButton extends StatelessWidget {
  const ColorSeedButton({super.key, required this.handleColorSelect, required this.colorSelected});

  final void Function(int) handleColorSelect;
  final ColorSeed colorSelected;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 10,
    runSpacing: 8,
    children: List.generate(
      ColorSeed.values.length,
      (i) => SizedBox.square(
        dimension: MediaQuery.of(context).size.height * 0.05,
        child: IconButton(
          iconSize: MediaQuery.of(context).size.height * 0.0313,
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.radio_button_unchecked),
          color: ColorSeed.values[i].color,
          isSelected: colorSelected.color == ColorSeed.values[i].color,
          selectedIcon: const Icon(Icons.circle),
          onPressed: () => handleColorSelect(i),
          tooltip: ColorSeed.values[i].label,
        ),
      ),
    ),
  );
}
