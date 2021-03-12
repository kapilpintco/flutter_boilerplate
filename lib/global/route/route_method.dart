import 'package:get/get.dart';

//app file
import 'route_name.dart';
import 'package:flutter_boilerplate/global/packages/screen_package.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.home, page: () => HomeScreen()),
  ];
}
