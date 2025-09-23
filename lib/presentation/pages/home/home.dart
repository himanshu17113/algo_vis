import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) => constraints.maxWidth > constraints.maxHeight ? DeskTopView() : MobileView());
  }
}

class DeskTopView extends StatelessWidget {
  const DeskTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DeskTopVeiw')),
      body: Center(child: Text('Hello, DeskTopVeiw!')),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MobileView')),
      body: Center(child: Text('Hello, MobileView!')),
    );
  }
}
