import 'package:flutter/material.dart';
import 'package:vacua_app/screens/homeScreen.dart';
import './SettingsPage.dart';
import 'makeReservation.dart';

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
      const MakeReservation(),
    ];
    final navBarItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: _index == 0
                ? const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 217, 0, 255),
                      Color.fromARGB(255, 205, 134, 158),
                    ],
                  )
                : null,
          ),
          child: const Icon(
            Icons.home,
          ),
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: _index == 1
                ? const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 217, 0, 255),
                      Color.fromARGB(255, 205, 134, 158),
                    ],
                  )
                : null,
          ),
          child: const Icon(
            Icons.search,
          ),
        ),
        label: "About",
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: _index == 2
                ? const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 217, 0, 255),
                      Color.fromARGB(255, 205, 134, 158),
                    ],
                  )
                : null,
          ),
          child: const Icon(
            Icons.add,
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
          unselectedItemColor: const Color.fromARGB(255, 216, 216, 216),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
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
