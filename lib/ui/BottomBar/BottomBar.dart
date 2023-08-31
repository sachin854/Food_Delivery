import 'package:flutter/material.dart';
class BottomBar extends StatefulWidget {
  BottomBar ({Key,key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar > {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Orders', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Message', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('E-wallet', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 30,),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,size: 30,),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message,size: 30,),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet,size: 30,),
              label: 'E-Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 30,),
              label: 'Profile',
            ),

          ],

          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}
