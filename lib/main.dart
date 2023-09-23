import 'package:flutter/material.dart';

void main() {
  runApp(NavBarApp());
}

class NavBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBarApp(),
    );
  }
}

class BottomNavBarApp extends StatefulWidget {
  @override
  State<BottomNavBarApp> createState() => _BottomNavBarAppState();
}

class _BottomNavBarAppState extends State<BottomNavBarApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nav Bar App'),
      ),
      body:  _listViewBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplay_rounded), label: 'Dailog'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget _listViewBody() {
     return ListView.separated(
         itemBuilder: (BuildContext context,int index){
           return Center(
             child: Text('Item $index'),
           );
         },
         separatorBuilder: (BuildContext context, int index) => Divider( thickness: 1,) ,
         itemCount: 50
     );
  }
}
