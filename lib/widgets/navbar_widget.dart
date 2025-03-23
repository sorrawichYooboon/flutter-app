import 'package:flutter/material.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.list), label: 'To-Do List'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onDestinationSelected: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
      selectedIndex: selectedIndex,
    );
  }
}
