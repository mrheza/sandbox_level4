import 'package:flutter/material.dart';
import './pages/dio.dart';
import './pages/local_storage.dart';
import 'package:slide_indexed_stack/slide_indexed_stack.dart';

void main() {
  runApp(const MyApp());
}

const List<Widget> _pages = <Widget>[
  DioPage(),
  LocalStoragePage(),
];
int _selectedIndex = 0;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainApp();
  }
}

class MainApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HSI Sandbox Level 4',
      home: Scaffold(
        body: SlideIndexedStack(
          axis: Axis.horizontal,
          slideOffset: 1,
          duration: const Duration(milliseconds: 250),
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          mouseCursor: SystemMouseCursors.grab,
          backgroundColor: const Color(0xFFF1F1F1),
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xFF233976),
          selectedFontSize: 12,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Dio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Local Storage',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
