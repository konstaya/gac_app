import 'package:flutter/material.dart';

// Паше
Widget __club_card(BuildContext context, verticalMargin, fontSize ){
  return Container(
    margin: EdgeInsets.symmetric(vertical: verticalMargin ?? 8,),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: Theme.of(context).colorScheme.secondaryContainer,
    ),

    child: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:  [
                  Text(
                    'клубная карта',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: fontSize ?? 20,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 78,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        '0001',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_double_arrow_right_outlined,
                      color: Theme.of(context).colorScheme.primary),
                ],
              )

            ],
          ),
        ),

      ],
    ),
  );
}
Widget __nearest_record(BuildContext context, Map<String, dynamic> parameters){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Text(
              'Ближайшая запись',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: parameters['fontSize'] ?? 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Йога для начинающих',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      padding: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                            size: 16.0,
                          ),
                          SizedBox(width: 4,),
                          Text(
                            'Сегодня',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 3, 0, 0),
                      padding: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                            size: 16.0,
                          ),
                          Text(
                            '18:00',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage('https://example.com/trainer.jpg'),
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage('https://example.com/trainer.jpg'),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Иванов Иван Иванович',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Инструктор йоги',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget club_card(BuildContext context, Map<String, dynamic> parameters ){
  return Container(
    margin: EdgeInsets.symmetric(vertical: parameters['verticalMargin'] ?? 8,),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: Theme.of(context).colorScheme.secondaryContainer,
    ),

    child: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:  [
                  Text(
                    'клубная карта',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: parameters['fontSize'] ?? 20,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 78,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        '0001',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_double_arrow_right_outlined,
                      color: Theme.of(context).colorScheme.primary),
                ],
              )

            ],
          ),
        ),

      ],
    ),
  );
}
Widget nearest_record(BuildContext context, Map<String, dynamic> parameters){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Text(
              'Ближайшая запись',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: parameters['fontSize'] ?? 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Йога для начинающих',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      padding: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                            size: 16.0,
                          ),
                          SizedBox(width: 4,),
                          Text(
                            'Сегодня',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 3, 0, 0),
                      padding: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                            size: 16.0,
                          ),
                          Text(
                            '18:00',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Builder(
                    builder: (context) {
                      if (parameters['showCoach'] == true) {
                        return Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.primary,
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage('https://example.com/trainer.jpg'),
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage('https://example.com/trainer.jpg'),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Иванов Иван Иванович',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onSurface,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Инструктор йоги',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onSurface,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        );
                      }
                      else {
                        return Container();
                      }
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}


Widget f(context){
  return Column( children: [ Row( mainAxisAlignment: MainAxisAlignment.start,children: [Container(margin: EdgeInsets.fromLTRB(0, 24, 0, 0), child: Text('Ближайшая запись', style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 20, fontWeight: FontWeight.w700, ), ), ),], ),Center( child: Container( margin: EdgeInsets.fromLTRB(0, 10, 0, 0), decoration: BoxDecoration( borderRadius: BorderRadius.circular(14), color: Theme.of(context).colorScheme.surfaceContainer, ), child: Container(padding: EdgeInsets.fromLTRB(16, 8, 16, 8), child: Column(children: [Container(alignment: Alignment.centerLeft, child: Text('Йога для начинающих', style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 18, fontWeight: FontWeight.w800, ), ), ), Row(mainAxisAlignment: MainAxisAlignment.start, children: [Container(margin: EdgeInsets.only(top: 3), padding: EdgeInsets.only(right: 10, left: 10), decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(21), ), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.calendar_month, color: Theme.of(context).colorScheme.onSecondaryContainer, size: 16.0, ), SizedBox(width: 4,), Text('Сегодня', style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer, fontSize: 16, fontWeight: FontWeight.w400, ), ),], ), ),Container(margin: EdgeInsets.fromLTRB(10, 3, 0, 0), padding: EdgeInsets.only(right: 10, left: 10), decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(21), ), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.access_time_outlined, color: Theme.of(context).colorScheme.onSecondaryContainer, size: 16.0,), Text('18:00', style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer, fontSize: 16, fontWeight: FontWeight.w400, ),)], ), ), ], ), Container(margin: EdgeInsets.only(top: 15), child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [Container(decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2, ), ), child: CircleAvatar(radius: 25, backgroundImage: NetworkImage('https://example.com/trainer.jpg'), backgroundColor: Colors.transparent, foregroundColor: Colors.transparent, child: Container(decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: NetworkImage('https://example.com/trainer.jpg'), fit: BoxFit.cover, alignment: Alignment.topCenter, ), ), ), ), ), Container(margin: EdgeInsets.only(left: 10), child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Иванов Иван Иванович', style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 16, fontWeight: FontWeight.w600, ), ), Text('Инструктор йоги', style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 14, fontWeight: FontWeight.normal, ), ),], ), ),], ), ), ], ), ), ), ), ], );

}
Widget f1(context){
  return Center(child: Container(margin: EdgeInsets.only(top: 8), decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: Theme.of(context).colorScheme.secondaryContainer), child: Column(children: [Container(margin: EdgeInsets.fromLTRB(16, 16, 16, 16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(children: [Text('клубная карта', style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer, fontSize: 20, fontWeight: FontWeight.w700))]), Row(children: [Container(width: 78, height: 24, decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(12)), child: Center(child: Text('0001', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16)))), Icon(Icons.keyboard_double_arrow_right_outlined, color: Theme.of(context).colorScheme.primary)])]))])));
}
Widget all_trainer_button(context){
  return Container(
    margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
    height: 56,
    width: MediaQuery.of(context).size.width * 0.95,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(29),
      color: Theme.of(context).colorScheme.primaryContainer,
    ),
    child: Container(
      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Наши тренеры',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text('Профессионалы своего дела')
        ],
      ),
    ),
  );
}
Widget record(context){
  return Container(
    height: 56,
    width: MediaQuery.of(context).size.width * 0.95,
    margin: EdgeInsets.only(top: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(29),
      color: Theme.of(context).colorScheme.primaryContainer,
    ),
    child: Container(
      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Записаться',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text('Подай заявку на персональный тренинг')

        ],
      ),
    ),
  );
}

Widget buildButton(context, {required String title, required String subtitle, required String assetPath}) {
  return Container(

    margin: EdgeInsets.only(top: 8),
    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
    width: (MediaQuery.of(context).size.width * 0.95-8)/2,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    height: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(

          child: ClipRect(
            child: Align(
              heightFactor: 1,
              alignment: Alignment.topCenter,
              child: Image.asset(
                assetPath,
                width: 120,
                height: 100,

              ),
            ),
          ),

        ),
      ],
    ),
  );
}
Widget buidButton2(context,
    {required String title1, required String subtitle1,required String title2, required String subtitle2 }){return Row(
  spacing: 8,
  children: [
    Expanded(
        child: buildButton(context, title: title1, subtitle: subtitle1,  assetPath: 'assets/coach.png')),
    Expanded(
        child: buildButton(context, title: title2, subtitle: subtitle2, assetPath: 'assets/gymapp.png'))
  ],
);}

