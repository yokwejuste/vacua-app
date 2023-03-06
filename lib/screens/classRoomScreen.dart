import 'package:flutter/material.dart';
import 'package:vacua_app/screens/homeScreen.dart';
import 'settingsWidget.dart';

class ClassRooms extends StatefulWidget {
  const ClassRooms({super.key});

  @override
  State<ClassRooms> createState() => _ClassRoomsState();
}

class _ClassRoomsState extends State<ClassRooms> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      const MainHomePage(),
      const Center(
        child: Icon(
          Icons.person,
          size: 50,
          color: Colors.red,
        ),
      ),
      const SettingsPage(),
    ];
    final navBarItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: _index == 0
                ? LinearGradient(
                    colors: [
                      Color.fromARGB(255, 217, 0, 255),
                      Color.fromARGB(255, 205, 134, 158),
                    ],
                  )
                : null,
          ),
          child: Icon(
            Icons.home,
          ),
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: _index == 1
                ? LinearGradient(
                    colors: [
                      Color.fromARGB(255, 217, 0, 255),
                      Color.fromARGB(255, 205, 134, 158),
                    ],
                  )
                : null,
          ),
          child: Icon(
            Icons.smart_display,
          ),
        ),
        label: "About",
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: _index == 2
                ? LinearGradient(
                    colors: [
                      Color.fromARGB(255, 217, 0, 255),
                      Color.fromARGB(255, 205, 134, 158),
                    ],
                  )
                : null,
          ),
          child: Icon(
            Icons.settings,
          ),
        ),
        label: "Profile",
      ),
    ];

    final bottomNavbar = Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(255, 216, 216, 216),
          selectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // backgroundColor: const Color(0xFF845EC2),
          currentIndex: _index,
          items: navBarItem,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
        ),
      ),
    );
    return Scaffold(
      bottomNavigationBar: bottomNavbar,
      body: pages[_index],
    );
  }
}
