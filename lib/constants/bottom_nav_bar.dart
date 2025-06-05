import 'package:flutter/material.dart';

Widget BottomNavBar(int currentElem, context){
  return SizedBox(
    height: 68,
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(80),
      selectedFontSize: 10,
      unselectedFontSize: 10,
      currentIndex: currentElem,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushReplacementNamed('/home');
            break;
          case 1:
            Navigator.of(context).pushReplacementNamed('/shedule');
            break;
          case 2:
            Navigator.of(context).pushReplacementNamed('/trainer');
            break;
          case 3:
            Navigator.of(context).pushReplacementNamed('/shop');
            break;
          case 4:
            Navigator.of(context).pushReplacementNamed('/profile');
            break;
        }
      },
      // showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Главная',
          backgroundColor: const Color.fromRGBO(40, 45, 49, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Расписание',
          backgroundColor: const Color.fromRGBO(40, 45, 49, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_kabaddi),
          label: 'Тренажеры',
          backgroundColor: const Color.fromRGBO(40, 45, 49, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          label: 'Магазин',
          backgroundColor: const Color.fromRGBO(40, 45, 49, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Профиль',
          backgroundColor: const Color.fromRGBO(40, 45, 49, 1),
        ),
      ],
    ),
  );
}