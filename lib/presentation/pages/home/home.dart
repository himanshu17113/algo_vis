import 'package:algo_vis/presentation/pages/widgets/body.dart';
import 'package:algo_vis/presentation/pages/widgets/indicator.dart';
import 'package:flutter/material.dart';
import '../../../const.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int type = 0;
  int subType = 0;
  final PageController controller = PageController();
  void changeType(int type, {int subType = 0}) => setState(() {
    this.type = type;
    this.subType = subType;
    controller.animateToPage(subType, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  });
  Widget bottomWidgetIcon(IconData icon, int length, {bool isSelected = false}) => Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(icon, size: 32),

      Indicator(controller: controller, count: length, isSelected: isSelected),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isDesktop = constraints.maxWidth > constraints.maxHeight * 1.2;
        return Scaffold(
          bottomNavigationBar: isDesktop
              ? null
              : BottomNavigationBar(
                  landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
                  items: [
                    BottomNavigationBarItem(
                      icon: bottomWidgetIcon(Icons.sort, 4, isSelected: type == 0),
                      label: 'Sort',
                    ),

                    BottomNavigationBarItem(
                      icon: bottomWidgetIcon(Icons.search, 2, isSelected: type == 1),
                      label: 'Search',
                    ),
                  ],
                  currentIndex: type,
                  onTap: changeType,
                ),
          body: Row(
            children: [
              Visibility(
                visible: isDesktop,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      algo.keys.length,
                      (index) => NavigationStructure(
                        title: algo.keys.elementAt(index),
                        callback: (i) => changeType(index, subType: i),
                        isSelected: type == index,
                        subType: subType,
                        label: algo.values.elementAt(index),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Body(
                  isDesktop: isDesktop,
                  key: ValueKey(type),
                  controller: controller,
                  algo: algoWidgets[type],
                  initialPage: subType,
                  onPageChanged: (page) {
                    setState(() {
                      subType = page;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NavigationStructure extends StatelessWidget {
  final void Function(int) callback;
  final List<String> label;
  final MapEntry<String, IconData> title;
  final int subType;
  final bool isSelected;
  const NavigationStructure({super.key, required this.callback, required this.label, required this.title, required this.subType, required this.isSelected});

  @override
  Widget build(BuildContext context) => Column(
    spacing: 8,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 6),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 4,
        children: [
          SizedBox(width: 6),
          Icon(title.value, color: Theme.of(context).colorScheme.inversePrimary),
          Text(title.key, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
      Column(
        spacing: 4,
        children: List.generate(
          label.length,
          (index) => NavigationButton(label: label[index], onTap: () => callback(index), isSelected: index == subType && isSelected),
          growable: false,
        ),
      ),
    ],
  );
}

class NavigationButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final bool isSelected;
  const NavigationButton({super.key, this.onTap, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) => InkWell(
    splashFactory: InkSparkle.splashFactory,
    onTap: onTap,
    borderRadius: BorderRadius.horizontal(right: Radius.circular(32)),
    child: Container(
      padding: EdgeInsets.fromLTRB(16, 12, 30, 12),
      width: 100 + MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).colorScheme.primaryContainer : null,
        borderRadius: BorderRadius.horizontal(right: Radius.circular(32)),
      ),

      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: isSelected ? Theme.of(context).colorScheme.onPrimaryContainer : Theme.of(context).colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
