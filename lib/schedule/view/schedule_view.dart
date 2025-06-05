import 'dart:convert';

import '../../constructor/config.dart';
import '../../constants/drawer_nav_bar.dart';
import '/constants/bottom_nav_bar.dart';
import '/profile/cubit/profile_cubit.dart';
import '/schedule/cubit/sch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  State<ScheduleView> createState() => _ScheduleViewState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ScheduleView());
  }
}

class _ScheduleViewState extends State<ScheduleView> {

  String TranslateMonth(String month) {
    if (month == 'January') {
      return 'Январь';
    }
    else if (month == 'February') {
      return 'Февраль';
    }
    else if (month == 'March') {
      return 'Март';
    }
    else if (month == 'April') {
      return 'Апрель';
    }
    else if (month == 'May') {
      return 'Май';
    }
    else if (month == 'June') {
      return 'Июнь';
    }
    else if (month == 'July') {
      return 'Июль';
    }
    else if (month == 'August') {
      return 'Август';
    }
    else if (month == 'September') {
      return 'Сентябрь';
    }
    else if (month == 'October') {
      return 'Октябрь';
    }
    else if (month == 'November') {
      return 'Ноябрь';
    }
    else if (month == 'December') {
      return 'Декабрь';
    }
    else {
      return 'XX';
    }
  }

  int selectedDayIndex = -1;
  var a;
  var d = [];
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    tzdata.initializeTimeZones();
    selectedDayIndex = DateTime.now().weekday - 1;
    a = fetchTraining();
    final timeZone = tz.getLocation(
        'Asia/Yekaterinburg');
    final now = tz.TZDateTime.now(timeZone);
    DateTime targetDate = now.subtract(Duration(days: now.weekday - 1)).add(Duration(days: selectedDayIndex));
    for (var elem in a){
      bool isSameDay = elem.year == targetDate.year &&
          elem.month == targetDate.month &&
          elem.day == targetDate.day;
      if (isSameDay){
        d.add(elem);
      }
    }
    BlocProvider.of<SchCubit>(context).fetchSchData();
  }



  int current = 1;

  List<String> items = [
    "Индивидуальные",
    "Групповые",
  ];


  @override
  Widget build(BuildContext context) {
    final timeZone = tz.getLocation(
        'Asia/Yekaterinburg');
    final now = tz.TZDateTime.now(timeZone);
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(Duration(days: 6));
    String translateDate(String day) {
      if (day == 'Mon') {
        return 'Пн';
      }
      else if (day == 'Tue') {
        return 'Вт';
      }
      else if (day == 'Wed') {
        return 'Ср';
      }
      else if (day == 'Thu') {
        return 'Чт';
      }
      else if (day == 'Fri') {
        return 'Пт';
      }
      else if (day == 'Sat') {
        return 'Сб';
      }
      else if (day == 'Sun') {
        return 'Вс';
      }
      else {
        return 'XX';
      }
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text('Расписание',
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery
              .of(context)
              .size
              .width * 0.95,
              height: 60,
              child: ListView.builder(
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin:
                            const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            width: (MediaQuery.of(context).size.width * 0.95-5) / 2,
                            alignment: Alignment.center,
                            height: 24,
                            decoration: BoxDecoration(
                              color: current == index
                                  ? Theme.of(context).colorScheme.primaryContainer
                                  : Theme.of(context).colorScheme.surfaceContainer,
                              borderRadius: current == index
                                  ? BorderRadius.circular(10)
                                  : BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                items[index],
                                style: current == index
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
                  }),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.95,
                height: 112,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          TranslateMonth(DateFormat.MMMM().format(now)),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    ),Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(7, (index) {
                            final currentDate = startOfWeek.add(Duration(days: index));
                            final isToday = currentDate.year == now.year &&
                                currentDate.month == now.month &&
                                currentDate.day == now.day;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDayIndex = index;
                                  DateTime targetDate = startOfWeek.add(Duration(days: selectedDayIndex));
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 48,
                                margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: selectedDayIndex == index ? Theme.of(context).colorScheme.primary: Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      translateDate(DateFormat.E().format(currentDate)),
                                      style: TextStyle(
                                        fontWeight: isToday || selectedDayIndex == index ? FontWeight.bold : FontWeight.normal,
                                        color: isToday || selectedDayIndex == index ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.onSecondaryContainer,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      DateFormat.d().format(currentDate),
                                      style: TextStyle(
                                        fontWeight: isToday || selectedDayIndex == index ? FontWeight.bold : FontWeight.normal,
                                        color: isToday || selectedDayIndex == index ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.onSurface.withAlpha(90),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: BlocBuilder<SchCubit, SchState>(
                    builder: (context, state){
                      if (state is SchLoading){
                        return Container(
                          margin: EdgeInsets.only(top: 70),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                      else if (state is SchError){
                        Navigator.of(context).pushReplacementNamed('/shedule');
                        return Container(
                          margin: EdgeInsets.only(top: 70),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                      else if((state is SchLoaded && (state).personList != null && (state).groupList != null && (state).grRecList != null)){
                        final personL = (state).personList;
                        final groupL = (state).groupList;
                        final grRecL = (state).grRecList;
                        if (personL != null && groupL != null && grRecL != null){
                          if (current == 0){
                            DateTime targetDate = startOfWeek.add(Duration(days: selectedDayIndex));
                            var temp = [];
                            for (var elem in personL){
                              bool isSameDay = elem.startTime.year == targetDate.year &&
                                  elem.startTime.month == targetDate.month &&
                                  elem.startTime.day == targetDate.day;
                              if (isSameDay){
                                temp.add(elem);
                              }
                            }
                            if (temp.isNotEmpty){
                              temp.sort((a, b) => a.startTime.compareTo(b.startTime));
                              return Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  width: MediaQuery.of(context).size.width * 0.93,
                                  height: temp.length * 300,
                                  child: ListView(
                                    primary: false,
                                    children: List.generate(temp.length, (index) {
                                      String status;
                                      if (temp[index].clientAccept == true){
                                        status = 'Принято';
                                      }else{
                                        status = 'Не принята';
                                      }
                                      Color tabBackColor = temp[index].clientAccept == true ? Color.fromRGBO(163, 212, 82, 1) : Color.fromRGBO(254, 107, 70, 1);
                                      TextStyle textStyle = temp[index].clientAccept == false
                                          ? TextStyle(color: Color.fromRGBO(254, 107, 70, 1), fontWeight: FontWeight.w500, fontSize: 16)
                                          : (temp[index].clientAccept == true
                                          ? TextStyle(color: Color.fromRGBO(163, 212, 82, 1), fontWeight: FontWeight.w500, fontSize: 16)
                                          : TextStyle(color: Color.fromRGBO(255, 255, 255, 0.38), fontWeight: FontWeight.w500, fontSize: 16));


                                      DateTime now = DateTime.now();
                                      now = now.add(Duration(hours: 5));
                                      DateTime startTime = temp[index].startTime;
                                      Color textColor = now.isBefore(startTime)
                                          ? Theme.of(context).colorScheme.onSurface
                                          : Theme.of(context).colorScheme.onSurface.withAlpha(50);

                                      return Container(
                                        width: MediaQuery.of(context).size.width * 0.83,
                                        margin: EdgeInsets.fromLTRB(0, 11, 0, 11),
                                        decoration: BoxDecoration(
                                          color: textColor,
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(24, 16, 16, 16),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                            child: Text(temp[index].trainingName.toString(),
                                                              overflow: TextOverflow.fade,
                                                              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w500, fontSize: 18),
                                                            ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(top: 10),
                                                        width: 70,
                                                        height: 24,
                                                        alignment: Alignment.centerLeft,
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(context).colorScheme.primaryContainer,
                                                            borderRadius: BorderRadius.circular(21)),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                             Icon(
                                                              Icons.access_time,
                                                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                                                              size: 16.0,
                                                            ),
                                                            Text(
                                                              DateFormat('HH:mm').format(temp[index].startTime).toString(),
                                                              style:  TextStyle(
                                                                color: Theme.of(context).colorScheme.surfaceContainer,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                          margin: EdgeInsets.only(top: 10,right: 15),
                                                          child: temp[index].clientAccept == false ? GestureDetector(
                                                            onTap: () async {
                                                              Future<String> delPers() async{
                                                                final box = GetStorage();
                                                                final token = "Bearer ${box.read('access')}";
                                                                String ur = 'https://vladixks.ru/api/v1/personal-trainings/${temp[index].id}/';
                                                                var url = Uri.parse(ur);
                                                                var response = await http.delete(
                                                                    url,
                                                                    headers: {"Authorization" : token, "Content-Type" : "application/json"}
                                                                );
                                                                print('11-------------------------11${response.statusCode.toString()}');
                                                                return response.statusCode.toString();
                                                              }
                                                              showDialog(
                                                                context: context,
                                                                barrierDismissible: false, // Запрещаем закрытие AlertDialog пользователем
                                                                builder: (BuildContext context) {
                                                                  return AlertDialog(
                                                                    title: Text('Загрузка...'),
                                                                    content: Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: [
                                                                        CircularProgressIndicator(), // Индикатор выполнения запроса
                                                                        SizedBox(height: 16),
                                                                        Text('Подождите, идет добавление заявки...'),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              await delPers();
                                                              Navigator.of(context).pop();
                                                              Navigator.of(context).pushReplacementNamed('/shedule');
                                                            },
                                                            child: Container(
                                                              width: 35,
                                                              height: 35,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                    color: Color.fromRGBO(254, 107, 70, 1),
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                ),
                                                                child: Container(
                                                                  child: Icon(
                                                                    Icons.delete_outline_outlined,
                                                                    color: Color.fromRGBO(254, 107, 70, 1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ) : Container()
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
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
                                                                backgroundImage: NetworkImage(temp[index].coachPhoto),
                                                              ),
                                                            ),
                                                            Container(
                                                                margin: EdgeInsets.only(left: 23),
                                                                width: 150,
                                                                height: 22,
                                                                child: Text(
                                                                  temp[index].coachName,
                                                                  style: TextStyle(
                                                                    color: Color.fromRGBO(240, 238, 238, 1),
                                                                    fontSize: 18,
                                                                  ),
                                                                  overflow: TextOverflow.clip,
                                                                )
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                          margin: EdgeInsets.only(top: 10,right: 15),
                                                          child: temp[index].clientAccept == false ? GestureDetector(
                                                            onTap: () async {
                                                              Future<String> acceptPers() async{
                                                                final box = GetStorage();
                                                                final token = "Bearer ${box.read('access')}";
                                                                print(temp[index].id.toString());
                                                                String ur = 'https://vladixks.ru/api/v1/personal-trainings/${temp[index].id}/';
                                                                var url = Uri.parse(ur);
                                                                var body = jsonEncode({
                                                                  "client_accept": true,
                                                                });
                                                                var response = await http.put(
                                                                    url,
                                                                    body: body,
                                                                    headers: {"Authorization" : token, "Content-Type" : "application/json"}
                                                                );
                                                                print('11-------------------------11${response.statusCode.toString()}');
                                                                return response.statusCode.toString();
                                                              }
                                                              showDialog(
                                                                context: context,
                                                                barrierDismissible: false, // Запрещаем закрытие AlertDialog пользователем
                                                                builder: (BuildContext context) {
                                                                  return AlertDialog(
                                                                    title: Text('Загрузка...'),
                                                                    content: Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: [
                                                                        CircularProgressIndicator(), // Индикатор выполнения запроса
                                                                        SizedBox(height: 16),
                                                                        Text('Подождите, идет добавление заявки...'),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              await acceptPers();
                                                              Navigator.of(context).pop();
                                                              Navigator.of(context).pushReplacementNamed('/shedule');
                                                            },
                                                            child: Container(
                                                              width: 35,
                                                              height: 35,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                    color: Color.fromRGBO(163, 212, 82, 1),
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                ),
                                                                child: Container(
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    color: Color.fromRGBO(163, 212, 82, 1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ) : Container()
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  ),
                                );
                            }
                            else{
                              return Center(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 180, 0, 0),
                                      child: Text("В этот день у вас нет тренировок",
                                        style: TextStyle(color:Theme.of(context).colorScheme.onSurface, fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                          else{
                            DateTime targetDate = startOfWeek.add(Duration(days: selectedDayIndex));
                            var temp = [];
                            for (var elem in groupL){
                              bool isSameDay = elem.startTime.year == targetDate.year &&
                                  elem.startTime.month == targetDate.month &&
                                  elem.startTime.day == targetDate.day && elem.clubId.toString() == box.read('club');
                              if (isSameDay){
                                temp.add(elem);
                              }
                            }
                            var recs = [];
                            for (var elem in grRecL){
                              recs.add(elem.groupId);
                            }
                            if (temp.isNotEmpty){
                              temp.sort((a, b) => a.startTime.compareTo(b.startTime));
                              return Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  width: MediaQuery.of(context).size.width * 0.93,
                                  height: temp.length * 240,
                                  child: ListView(
                                    primary: false,
                                    children: List.generate(temp.length, (index) {
                                      int mest = 0;
                                      for (var elem in grRecL){
                                        if (elem.groupId.toString() == temp[index].id.toString())
                                        {
                                          mest += 1;
                                        }
                                      }
                                      TextStyle textStyle = mest <= temp[index].left
                                          ? TextStyle(color: Color.fromRGBO(254, 107, 70, 1), fontWeight: FontWeight.w500, fontSize: 16)
                                          : (mest >= temp[index].left
                                          ? TextStyle(color: Color.fromRGBO(163, 212, 82, 1), fontWeight: FontWeight.w500, fontSize: 16)
                                          : TextStyle(color: Color.fromRGBO(255, 255, 255, 0.38), fontWeight: FontWeight.w500, fontSize: 16));

                                      TextStyle textStyle2 = recs.contains(temp[index].id) == false
                                          ? TextStyle(color: Color.fromRGBO(254, 107, 70, 1), fontWeight: FontWeight.w500, fontSize: 16)
                                          : (recs.contains(temp[index].id) == true
                                          ? TextStyle(color: Color.fromRGBO(163, 212, 82, 1), fontWeight: FontWeight.w500, fontSize: 16)
                                          : TextStyle(color: Color.fromRGBO(255, 255, 255, 0.38), fontWeight: FontWeight.w500, fontSize: 16));

                                      DateTime now = DateTime.now();
                                      now = now.add(Duration(hours: 5));
                                      DateTime startTime = temp[index].startTime;
                                      Color textColor = now.isBefore(startTime)
                                          ? Theme.of(context).colorScheme.surfaceContainerHighest
                                          : Theme.of(context).colorScheme.surfaceContainer;
                                      return Container(
                                        width: MediaQuery.of(context).size.width * 0.83,
                                        margin: EdgeInsets.fromLTRB(0, 11, 0, 11),
                                        decoration: BoxDecoration(
                                          color: textColor,
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(24, 16, 16, 16),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Text(temp[index].trainingName.toString(),
                                                            overflow: TextOverflow.fade,
                                                            style: TextStyle(color: Color.fromRGBO(167, 163, 163, 1), fontWeight: FontWeight.w500, fontSize: 18),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(top: 10),
                                                        width: 70,
                                                        height: 24,
                                                        alignment: Alignment.centerLeft,
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(context).colorScheme.primaryContainer,
                                                            borderRadius: BorderRadius.circular(21)),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                             Icon(
                                                              Icons.access_time,
                                                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                                                              size: 16.0,
                                                            ),
                                                            Text(
                                                              DateFormat('HH:mm').format(temp[index].startTime).toString(),
                                                              style: TextStyle(
                                                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                          child: Text("Продолжительность: " + temp[index].duration.toString() + " минут",
                                                            style:  TextStyle(
                                                              color: Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(80),
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                          ),
                                                        margin: EdgeInsets.only(top: 10),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                          margin: EdgeInsets.only(top: 10),
                                                          child: Text(recs.contains(temp[index].id) == false ? "Осталось мест: " + (temp[index].left - mest).toString() : "Вы записаны"
                                                            ,
                                                            style: textStyle2,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(top: 15),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                border: Border.all(
                                                                  color: Colors.blue,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              // child: CircleAvatar(
                                                              //   radius: 25,
                                                              //   backgroundImage: NetworkImage(temp[index].coachPhoto),
                                                              // ),
                                                              child: CircleAvatar(
                                                                radius: 25,
                                                                backgroundImage: NetworkImage(
                                                                  temp[index].coachPhoto,
                                                                ),
                                                                backgroundColor: Colors.transparent,
                                                                foregroundColor: Colors.transparent,
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    image: DecorationImage(
                                                                      image: NetworkImage(temp[index].coachPhoto),
                                                                      fit: BoxFit.cover,
                                                                      alignment: Alignment.topCenter,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                                margin: EdgeInsets.only(left: 23),
                                                                width: 150,
                                                                height: 22,
                                                                child: Text(
                                                                  temp[index].coachName,
                                                                  style: TextStyle(
                                                                    color: Color.fromRGBO(240, 238, 238, 1),
                                                                    fontSize: 18,
                                                                  ),
                                                                  overflow: TextOverflow.clip,
                                                                )
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(top: 10,right: 15),
                                                        child: recs.contains(temp[index].id) == false ? GestureDetector(
                                                          onTap: () async {
                                                            Future<String> addGrRec() async{
                                                              final box = GetStorage();
                                                              final token = "Bearer ${box.read('access')}";
                                                              String ur = 'https://vladixks.ru/api/v1/group_records';
                                                              var url = Uri.parse(ur);
                                                              var body = jsonEncode({
                                                                "client": int.parse(box.read('id')),
                                                                "group_training": temp[index].id,
                                                              });
                                                              var response = await http.post(
                                                                  url,
                                                                  body: body,
                                                                  headers: {"Authorization" : token, "Content-Type" : "application/json"}
                                                              );
                                                              print('11-------------------------11${response.statusCode.toString()}');
                                                              return response.statusCode.toString();
                                                            }
                                                            showDialog(
                                                              context: context,
                                                              barrierDismissible: false, // Запрещаем закрытие AlertDialog пользователем
                                                              builder: (BuildContext context) {
                                                                return AlertDialog(
                                                                  title: Text('Загрузка...'),
                                                                  content: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                                      CircularProgressIndicator(), // Индикатор выполнения запроса
                                                                      SizedBox(height: 16),
                                                                      Text('Подождите, идет добавление заявки...'),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            await addGrRec();
                                                            Navigator.of(context).pop();
                                                            Navigator.of(context).pushReplacementNamed('/shedule');
                                                          },
                                                          child: Container(
                                                            width: 35,
                                                            height: 35,
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: Color.fromRGBO(39, 136, 236, 1),
                                                                ),
                                                                borderRadius: BorderRadius.circular(20),
                                                              ),
                                                              child: Container(
                                                                child: Icon(
                                                                  Icons.check,
                                                                  color: Color.fromRGBO(39, 136, 236, 1),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ) : Container()
                                                      ),
                                                    ],
                                                  )

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              );
                            }
                            else{
                              return Center(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 180, 0, 0),
                                      child: Text("В этот день у вас нет тренировок",
                                        style: TextStyle(color:Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(80), fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        }else{
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          );
                        }

                      }
                      else{
                        return Container(
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    }
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GACRules.navBarType == 0 ?
        BottomNavBar(1, context) : null,
      drawer: GACRules.navBarType == 1 ?
        DrawerNavBar(1, context): null,
    );
  }
}

// Future<List<DateTime>> fetchTraining() async {
//   try {
//     final url = Uri.parse('https://vladixks.ru/api/v1/personal_trainings_own');
//     final response = await http.get(
//       url,
//       headers: {"Authorization" : "Bearer ."}
//     );
//     String dateString = ((jsonDecode(utf8.decode(response.bodyBytes)))[0]['time_start']).toString();
//     List<DateTime> dateTimes = [
//       DateTime.parse("2023-05-26T09:15:00Z"),
//       DateTime.parse("2023-05-26T09:15:00Z"),
//       DateTime.parse("2023-05-28T18:30:45Z"),
//     ];
//     dateTimes.sort((a, b) => a.compareTo(b));
//     for (var dateTime in dateTimes) {
//       print(dateTime.toIso8601String());
//     }
//     return dateTimes;
//   } catch (e) {
//     print(e);
//     return [];
//   }
// }

List<DateTime> fetchTraining() {
  try {
    List<DateTime> dateTimes = [
      DateTime.parse("2023-06-05T09:15:00Z"),
      DateTime.parse("2023-06-07T09:15:00Z"),
      DateTime.parse("2023-06-07T18:30:45Z"),
    ];
    dateTimes.sort((a, b) => a.compareTo(b));
    for (var dateTime in dateTimes) {
      print(dateTime.toIso8601String());
    }
    return dateTimes;
  } catch (e) {
    print(e);
    return [];
  }
}

class WeekViewWidget extends StatefulWidget {
  @override
  _WeekViewWidgetState createState() => _WeekViewWidgetState();
}

class _WeekViewWidgetState extends State<WeekViewWidget> {
  int selectedDayIndex = -1;
  var a;
  var d = [];

  @override
  void initState() {
    super.initState();
    tzdata.initializeTimeZones();
    selectedDayIndex = DateTime.now().weekday - 1;
    a = fetchTraining();
    final timeZone = tz.getLocation(
        'Asia/Yekaterinburg');
    final now = tz.TZDateTime.now(timeZone);
    DateTime targetDate = now.subtract(Duration(days: now.weekday - 1)).add(Duration(days: selectedDayIndex));
    for (var elem in a){
      bool isSameDay = elem.year == targetDate.year &&
          elem.month == targetDate.month &&
          elem.day == targetDate.day;
      if (isSameDay){
        d.add(elem);
      }
    }
    print('---------------------------------------=======');
    print(d.length);
  }

  @override
  Widget build(BuildContext context) {
    final timeZone = tz.getLocation(
        'Asia/Yekaterinburg'); // Specify the desired time zone
    final now = tz.TZDateTime.now(timeZone);
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(Duration(days: 6));

    String translateDate(String day) {
      if (day == 'Mon') {
        return 'Пн';
      }
      else if (day == 'Tue') {
        return 'Вт';
      }
      else if (day == 'Wed') {
        return 'Ср';
      }
      else if (day == 'Thu') {
        return 'Чт';
      }
      else if (day == 'Fri') {
        return 'Пт';
      }
      else if (day == 'Sat') {
        return 'Сб';
      }
      else if (day == 'Sun') {
        return 'Вс';
      }
      else {
        return 'XX';
      }
    }

    return Container(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(7, (index) {
            final currentDate = startOfWeek.add(Duration(days: index));
            final isToday = currentDate.year == now.year &&
                currentDate.month == now.month &&
                currentDate.day == now.day;

            return GestureDetector(
              onTap: () {
                setState(() {
                  var d = [];
                  selectedDayIndex = index;
                  DateTime targetDate = startOfWeek.add(Duration(days: selectedDayIndex));
                  for (var elem in a){
                    bool isSameDay = elem.year == targetDate.year &&
                        elem.month == targetDate.month &&
                        elem.day == targetDate.day;
                    if (isSameDay){
                      d.add(elem);
                    }
                  }
                  print('---------------------------------------=======');
                  print(d.length);
                });
              },
              child: Container(
                width: 43,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: selectedDayIndex == index ? Color.fromRGBO(
                      217, 217, 217, 1) : Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      translateDate(DateFormat.E().format(currentDate)),
                      style: TextStyle(
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                        color: isToday ? Color.fromRGBO(124, 124, 124, 1) : Color.fromRGBO(184, 184, 184, 1),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat.d().format(currentDate),
                      style: TextStyle(
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                        color: isToday ? Color.fromRGBO(69, 69, 69, 1) : Color.fromRGBO(124, 124, 124, 1),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}