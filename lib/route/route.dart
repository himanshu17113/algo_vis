import 'package:flutter/widgets.dart';

import '../presentation/pages/home/home.dart';

class Routes {
  static const String home = "/";
   static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (final BuildContext context) => const Home(),};
}