import 'package:flutter/material.dart';
import 'package:netflixui/screens/screens.dart';
import 'package:netflixui/widgets/responsive.dart';
class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  final List<Widget> _screens=[
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int _currentIndex=0;

  final Map<String, IconData> _icons=const{
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      
      bottomNavigationBar: !Responsive.isDesktop(context) ?
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: _icons
            .map((title, icon) => MapEntry(
            title,
            BottomNavigationBarItem(
              icon: Icon(icon,size: 20.0,),
              title: Text(''),
            ))
        ).values.toList(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11.0,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11.0,
        onTap: (index) => setState(() {
          _currentIndex=index;
        }),
      ) : null,
    );
  }
}
