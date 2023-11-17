import 'package:flutter/material.dart';

class ComponentMenu extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  ComponentMenu({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      iconSize: 30,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.discount_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_toggle_off_outlined),
          label: '',
        ),
      ],
      unselectedItemColor: Color.fromRGBO(184, 184, 184, 1),
      selectedItemColor: Color.fromRGBO(219, 88, 143, 1),
    );
  }
}
