import 'package:flutter/material.dart';



enum ColorSeed {
  white('M3 Baseline', Colors.white),
  baseColor('M3 Baseline', Color(0xff6750a4)),
  olor('M3 Baseline', Color(0xffB33B15)),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  orange('Orange', Colors.orange),
  grey('gey', Color(0xFF2D2E32)),
  deepOrange('Deep Orange', Colors.deepOrange),
  pink('Pink', Colors.pink);

  const ColorSeed(this.label, this.color);
  final String label;
  final Color color;
}
