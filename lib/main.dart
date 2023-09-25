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
  final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nav Bar App'),
      ),
      body: _listViewBody(),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.airplay_rounded), label: 'Dailog'),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            switch (index) {
              case 0: // only scroll to top when current index is selected
                if (_selectedIndex == index) {
                  _homeController.animateTo(0.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOut);
                }
                break;
              case 1:
                showModal(context);
            }
            _onItemTapped;
          }),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget _listViewBody() {
    return ListView.separated(
       controller: _homeController,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text('Item $index'),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
              thickness: 1,
            ),
        itemCount: 100);
  }

  void showModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: Text('Sample Dailog'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('close'))
              ],
            ));
  }
}
