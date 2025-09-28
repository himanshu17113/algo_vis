import 'package:algo_vis/const.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Widget> algo;
  final int initialPage;
  final void Function(int)? onPageChanged;
  final PageController controller;
  final bool isDesktop;
  const Body({super.key, required this.algo, this.initialPage = 0, this.onPageChanged, required this.controller, this.isDesktop = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.inversePrimary,
      margin: !isDesktop ? EdgeInsets.zero : const EdgeInsets.all(6),
      child: PageView.builder(controller: controller, itemCount: algo.length, onPageChanged: onPageChanged, itemBuilder: (context, index) => algo[index]),
    );
  }
}
