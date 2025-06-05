import 'package:flutter/material.dart';

Widget DrawerNavBar(int currentElem,  context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration( color: Theme.of(context).colorScheme.primaryContainer),
          child: Text(
            '',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 24),
          ),
        ),
        ListTile(
          selected: currentElem == 0,
          selectedColor: Theme.of(context).colorScheme.primary,
          leading: const Icon(Icons.home),
          title: const Text('Главная'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
        ),
        ListTile(
          selected: currentElem == 1,
          selectedColor: Theme.of(context).colorScheme.primary,
          leading: const Icon(Icons.calendar_month),
          title: const Text('Расписание'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/shedule');
          },
        ),
        ListTile(
          selected: currentElem == 2,
          leading: const Icon(Icons.sports_kabaddi),
          title: const Text('Тренажёры'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/trainer');
          },
        ),
        ListTile(
          selected: currentElem == 3,
          selectedColor: Theme.of(context).colorScheme.primary,
          leading: const Icon(Icons.shopping_basket),
          title: const Text('Магазин'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/shop');
          },
        ),
        ListTile(
          selected: currentElem == 4,
          selectedColor: Theme.of(context).colorScheme.primary,
          leading: const Icon(Icons.person),
          title: const Text('Профиль'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/profile');
          },
        ),
      ],
    ),
  );
}