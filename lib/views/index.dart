import 'package:flutter/material.dart';
import 'package:get/get.dart';

//app file
import 'package:flutter_boilerplate/controllers/home_controller.dart';

class HomeLayout extends StatelessWidget {
  var homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: GetBuilder<HomeController>(
        builder: (_) => Center(
          child: homeCtrl.widgetOptions.elementAt(homeCtrl.selectedIndex),
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (_) => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: homeCtrl.selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: homeCtrl.onItemTapped,
        ),
      ),
    );
  }
}
