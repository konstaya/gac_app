import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class GymAppConstructorRules{
  final String name;
  final int navBarType;
  final FlexScheme colorScheme;
  final TextTheme textTheme;
  final Map<String, GAPage> pages;

  GymAppConstructorRules({
    required this.name,
    required this.navBarType,
    required this.colorScheme,
    required this.textTheme,
    required this.pages,
  });
}
class GAPage {
  final String pageTitle;
  final IconData pageIcon;
  final List<GAWidget> widgets;
  final int id;

  GAPage({
    required this.pageTitle,
    required this.pageIcon,
    required this.widgets,
    required int this.id,
  });

}
class GAWidget {
  final int id;
  final String category;
  final String metadata;
  final Map<String, dynamic> parameters;
  final Widget Function(BuildContext, Map<String, dynamic>) func;

  GAWidget({
    required this.id,
    required this.category,
    required this.func,
    this.metadata = '',
    this.parameters = const {},
  });

}




Widget club_info(context){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Text(
              'Клуб',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: 60,
        child: ListView.builder(
          itemCount: 3, // Статическое количество элементов
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Убираем логику setState, так как виджет статический
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                    width: (MediaQuery.of(context).size.width * 0.95 - 6 * 2) / 3,
                    height: 24,
                    decoration: BoxDecoration(
                      color: index == 0
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Клуб ${index + 1}', // Статический текст
                        style: index == 0
                            ? TextStyle(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontSize: 16)
                            : TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 136,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: Column(
            children: [
              Text(
                'Информация о клубе',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Адрес: ул. Примерная, 1',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                ),
              ),
              Text(
                'Телефон: +7 (123) 456-78-90',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
Widget club(context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Text(
              'Клуб',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: 60,
        child: ListView.builder(
          itemCount: 3, // Статическое количество элементов
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Убираем логику setState, так как виджет статический
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                    width: (MediaQuery.of(context).size.width * 0.95 - 6 * 2) / 3,
                    height: 24,
                    decoration: BoxDecoration(
                      color: index == 0
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Клуб ${index + 1}', // Статический текст
                        style: index == 0
                            ? TextStyle(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontSize: 16)
                            : TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 136,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: Column(
            children: [
              Text(
                'Информация о клубе',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Адрес: ул. Примерная, 1',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                ),
              ),
              Text(
                'Телефон: +7 (123) 456-78-90',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
