import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Indicator extends StatelessWidget {
  final PageController controller;
  final int count;
  final bool isSelected;
  const Indicator({super.key, required this.controller, required this.count, this.isSelected = false});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: Durations.long3,
    width: isSelected ? null : 0,
    margin: EdgeInsets.only(left: isSelected ? 6 : 2, right: isSelected ? 4 : 0),
    padding: EdgeInsets.symmetric(horizontal: isSelected ? 16 : 0, vertical: 8),

    decoration: BoxDecoration(color: Theme.of(context).colorScheme.tertiaryContainer, borderRadius: BorderRadius.circular(isSelected ? 16 : 4)),

    child: Visibility(
      visible: isSelected,
      child: SmoothPageIndicator(
        onDotClicked: (index) => controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
        controller: controller,
        count: count,
        effect: WormEffect(
          dotHeight: 16,
          dotWidth: 16,
          type: WormType.thinUnderground,
          activeDotColor: Theme.of(context).colorScheme.inversePrimary,
          dotColor: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
    ),
  );
}
