import '../screens/symptoms _screen.dart';
import 'package:covitrac/screens/dashboard.dart';
import 'package:flutter/material.dart';
import '../screens/precautions_screen.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedPage = 0;

  final _pageOptions = [
    Dashboard(),
    PrecautionScreen(),
    SymptomsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.sick), title: Text('Cases')),
            BottomNavigationBarItem(
                icon: Icon(Icons.sick), title: Text('Precautions')),
            BottomNavigationBarItem(
                icon: Icon(Icons.sick), title: Text('Symptoms')),
          ],
          selectedItemColor: Colors.green[500],
          elevation: 5.0,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
