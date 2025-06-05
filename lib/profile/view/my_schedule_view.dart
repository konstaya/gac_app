import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../schedule/cubit/sch_cubit.dart';
import '../cubit/profile_cubit.dart';

class MyScheduleView extends StatefulWidget {
  const MyScheduleView({Key? key}) : super(key: key);

  @override
  State<MyScheduleView> createState() => _MyScheduleViewState();
}

class _MyScheduleViewState extends State<MyScheduleView> {

  @override void initState() {
    super.initState();
    BlocProvider.of<SchCubit>(context).fetchSchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 28, 31, 1.0),
        appBar: AppBar(
          title: Text('Мое расписание'),
          backgroundColor: Color.fromRGBO(24, 28, 31, 1.0),
          elevation: 0,
        ),
        body: Container(
          child: BlocBuilder<SchCubit, SchState>(builder: (context, state) {
            if (state is SchLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            else if ((state is SchLoaded && (state).personList != null &&
                (state).groupList != null && (state).grRecList != null)) {
              final box = GetStorage();
              final personL = (state).personList;
              final groupL = (state).groupList;
              final grRecL = (state).grRecList;
              var temp = [];
              if (personL != null && personL.isNotEmpty) {
                for (var elem in personL) {
                  temp.add(elem);
                }
              }
              if (grRecL != null && grRecL.isNotEmpty && groupL != null &&
                  groupL.isNotEmpty) {
                for (var elem in groupL) {
                  for (var rec in grRecL) {
                    if (elem.id == rec.groupId &&
                        rec.clientId.toString() == box.read("id")) {
                      temp.add(elem);
                    }
                  }
                }
              }
              DateTime now = DateTime.now();
              if (temp.isEmpty) {
                return Center(child: Text("У вас нет записи на тренировки", style: TextStyle(color: Colors.white),),);
              }
              else {
                var filteredList = temp.where((training) {
                  DateTime startTime = training.startTime;
                  return startTime.isAfter(now);
                }).toList();
                filteredList.sort((a, b) {
                  DateTime startTimeA, startTimeB;
                  startTimeA = a.startTime;
                  startTimeB = b.startTime;
                  return startTimeA.compareTo(startTimeB);
                });
                if (filteredList.isEmpty) {
                  return Center(child: Text("У вас нет записи на тренировки", style: TextStyle(color: Colors.white),),);
                }
                else {

                  return SingleChildScrollView(
                    child: Container(
                      height: (filteredList.length * 170),
                      child: ListView(
                        primary: false,
                        children: List.generate(filteredList.length, (index) {
                          final currentDate = DateTime.now();
                          final inputDate = filteredList[index].startTime;
                          DateTime targetDate;
                          var text = "${DateFormat("dd.MM.yyyy").format(inputDate)}";

                          if (currentDate.year == inputDate.year &&
                              currentDate.month == inputDate.month &&
                              currentDate.day == inputDate.day) {
                            targetDate = currentDate;
                            text = "Сегодня";
                          } else if (currentDate.year == inputDate.year &&
                              currentDate.month == inputDate.month &&
                              currentDate.day + 1 == inputDate.day) {
                            targetDate = inputDate;
                            text = "Завтра";
                          } else {
                          }
                          return Container(
                              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                              width: MediaQuery.of(context).size.width * 0.95,
                              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Color.fromRGBO(40, 45, 49, 1),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    alignment : Alignment.centerLeft,
                                    child: Text(
                                      filteredList[index].trainingName,
                                      style: TextStyle(
                                          color: Color.fromRGBO(217, 217, 217, 1),
                                          fontSize: 18
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 3),
                                        width: ((text == 'Завтра') || (text == 'Сегодня'))? 86: 110,
                                        height: 24,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(39, 136, 236, 1)
                                            ,
                                            borderRadius: BorderRadius.circular(21)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              color: Color.fromRGBO(40, 45, 49, 1),
                                              size: 16.0,
                                            ),
                                            Text(
                                              text,
                                              style: const TextStyle(
                                                color: Color.fromRGBO(40, 45, 49, 1),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10, 3, 0, 0),
                                        width: 70,
                                        height: 24,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(39, 136, 236, 1)
                                            ,
                                            borderRadius: BorderRadius.circular(21)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.timelapse,
                                              color: Color.fromRGBO(40, 45, 49, 1),
                                              size: 16.0,
                                            ),
                                            Text(
                                              filteredList[index].startTime.hour.toString() + ":" + (filteredList[index].startTime.minute.toString() == "0" ? "00" : filteredList[index].startTime.minute.toString()),
                                              style: const TextStyle(
                                                color: Color.fromRGBO(40, 45, 49, 1),
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
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(filteredList[index].coachPhoto),
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.blue,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: 23),
                                            width: 150,
                                            height: 22,
                                            child: Text(
                                              filteredList[index].coachName,
                                              style: TextStyle(
                                                color: Color.fromRGBO(240, 238, 238, 1),
                                                fontSize: 18,
                                              ),
                                              overflow: TextOverflow.clip,
                                            )
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ));
                        }),
                      ),
                    ),
                  );
                }
              }
            }
            else if (state is SchError) {
              Navigator.of(context).pushReplacementNamed('/');
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
            else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          }
          ),
        )
    );
  }
}
