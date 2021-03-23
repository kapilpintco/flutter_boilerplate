import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/global/packages/config_package.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void onItemTapped(int index) {
    _selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    List<dynamic> items = [
      {'title': 'abc'},
      {'title': 'xyz'}
    ];

    dynamic data = helper.filter(items, 'title', 'ab');
    print(data);

    super.onInit();
  }
}
