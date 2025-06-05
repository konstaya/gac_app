import 'package:gac_app/constructor/config.dart';
import 'package:gac_app/constructor/models.dart';

import '../../constants/drawer_nav_bar.dart';
import '/home/view/all_coach_view.dart';
import '/home/view/request_view.dart';
import '/schedule/cubit/sch_cubit.dart';
import 'package:flutter/material.dart';
import '/profile/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/bottom_nav_bar.dart';
import '../../profile/view/membership_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeView());
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<String> items = [
    "Загрузка",
    "Акции",
    "Контакты",
  ];
  int current = 0;
  @override void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).fetchDataClub();
    BlocProvider.of<SchCubit>(context).fetchSchData();
  }

  String getPhone(phone) {
    StringBuffer sb = StringBuffer();
    sb.write("+" + phone[0] + " ");
    sb.write(phone.substring(2, 5) + " ");
    sb.write(phone.substring(6, 9) + " ");
    sb.write(phone.substring(9, 11) + " ");
    sb.write(phone[11] + "5");
    return sb.toString();
  }

  Widget tabChoice(i, club, proms) {
    int prom_count = proms.length;

    if (i == 0 && club != null) {
      return Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 45,
                    child: Image.asset('assets/svetofor_green.png')),
                Text('2 балла',
                style: TextStyle( fontSize: 20, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onSurface),),
                Text('Сейчас в клубе '+club[0].numberOfPeople.toString()+' человек',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6)),),

              ],
            ),
          ));
    }
    else if (i == 1 && club != null) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        padding: EdgeInsets.all(2),
        child: Center(
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: prom_count,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Card(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    child: Container(
                      height: 160,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Image.network(
                          proms[index].imageUrl,
                          height: 160,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    } else if (i == 2 && proms != null) {
      return Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Column(
              children: [

                Text(
                  club[0].name.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onSecondaryContainer),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //width: 125,
                      height: 24,
                      margin: EdgeInsets.only(top: 8),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(21)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Icon(
                            Icons.access_time_outlined,
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                            size: 18.0,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            club[0].openingHours,
                            style:  TextStyle(
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: const Text('Error'),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          //toolbarHeight: 93,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text(
              //  // 'Привет, ' + "Тая",
              //  "",
              //  style: TextStyle(
              //    // height: 24,
              //    fontSize: 20,
              //    color: Color.fromRGBO(228, 226, 226, 1),
              //  ),
              //  textAlign: TextAlign.left,
              //),
              Text(
                GACRules.name,
                style: TextStyle(

                  // height: 24,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          )
      ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.95,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) {
                      final mainPage = GACRules.pages['main'];
                      if (mainPage != null) {
                        return Column(
                          children: mainPage.widgets.map((
                              widget) {
                            return widget.func(context, widget.parameters);
                          }).toList(),
                        );
                      }
                      else {
                        return Container();
                      }
                    }
                  ),
                  /*
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MembershipView(),
                        ),
                      );
                    },
                    child: gaWidget1.func(context, gaWidget1.parameters),
                  ),

                  // Ближайшая запись
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                          child: Text(
                            'Ближайшая запись',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,),

                          )),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Theme.of(context).colorScheme.surfaceContainer,
                      ),
                      child: BlocBuilder<SchCubit, SchState>(builder: (context,state){
                        if (state is SchLoading){
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        else if((state is SchLoaded && (state).personList != null && (state).groupList != null && (state).grRecList != null)){
                          final box = GetStorage();
                          final personL = (state).personList;
                          final groupL = (state).groupList;
                          final grRecL = (state).grRecList;
                          var temp = [];
                          if (personL != null && personL.isNotEmpty){
                            for (var elem in personL){
                              temp.add(elem);
                            }
                          }
                          if (grRecL != null && grRecL.isNotEmpty && groupL != null && groupL.isNotEmpty){
                            for (var elem in groupL){
                              for (var rec in grRecL){
                                if (elem.id == rec.groupId && rec.clientId.toString() == box.read("id")){
                                  temp.add(elem);
                                }
                              }
                            }
                          }
                          DateTime now = DateTime.now();
                          if (temp.isEmpty){
                            return Center(
                              child: Text("У вас нет записи на тренировки",
                                style:
                                  TextStyle(color: Theme.of(context).colorScheme.onSurface),),);
                          }
                          else{
                            print(temp);
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
                            if (filteredList.isEmpty){
                              return Center(child: Text("У вас нет записи на тренировки"),);
                            }
                            else{
                              final currentDate = DateTime.now();
                              final inputDate = filteredList[0].startTime;
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
                                // не обрабатывается вариант, когда тренировка завтра, но завтра другой месяц, сравнивать по DateTime надо
                              }
                              return Container(
                                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment : Alignment.centerLeft,
                                        child: Text(
                                          filteredList[0].trainingName,
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
                                                borderRadius: BorderRadius.circular(21)),
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
                                                  text,
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
                                                borderRadius: BorderRadius.circular(21)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                 Icon(
                                                  Icons.access_time_outlined,
                                                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                                                  size: 16.0,
                                                ),
                                                Text(
                                                  DateFormat('HH:mm').format(filteredList[0].startTime).toString(),
                                                  style:  TextStyle(
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
                                              // child: CircleAvatar(
                                              //   radius: 25,
                                              //   backgroundImage: NetworkImage(filteredList[0].coachPhoto),
                                              // ),
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundImage: NetworkImage(
                                                  filteredList[0].coachPhoto,
                                                ),
                                                backgroundColor: Colors.transparent,
                                                foregroundColor: Colors.transparent,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: NetworkImage(filteredList[0].coachPhoto),
                                                      fit: BoxFit.cover,
                                                      alignment: Alignment.topCenter,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(left: 23),
                                                //width: 150,
                                                //height: 22,
                                                child: Text(
                                                  filteredList[0].coachName,
                                                  style: TextStyle(
                                                    color: Theme.of(context).colorScheme.onSurface,
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
                            }
                          }
                        }
                        else if (state is SchError){
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          );
                        }
                        else{
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                      }
                      ),
                    ),
                  ),
                  // Клуб
                  buidButton2(context, title1: 'Тренеры', subtitle1: 'профессионалы', title2: 'Клуб', subtitle2: '8:00-22:00'),
                  f1(context),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoading){
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      else if (state is ProfileLoaded && (state).myServices != null){
                        final myCoach = state.coachInfo;
                        if (myCoach != null && myCoach.isNotEmpty){
                          return GestureDetector(
                            onTap: () => _dialogBuilder(context, 'У вас уже\nесть тренер!'),
                            child:  Container(
                              //height: 56,
                              width: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(29),
                                color: Theme.of(context).colorScheme.primaryContainer,
                              ),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                padding: EdgeInsets.all(16),
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
                            ),
                          );
                        }
                        else {
                          return GestureDetector(
                            onTap: () => _dialogBuilder(context, 'заявка'),
                            child:  Container(
                              margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                              padding: EdgeInsets.only(right: 16, left: 16, bottom: 8),
                              //height: 56,
                              width: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(29),
                                color: Theme.of(context).colorScheme.primaryContainer,
                              ),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Записаться',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text('Подай заявку на персональный тренинг',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        fontSize: 12,

                                      ),
                                      textAlign: TextAlign.center,
                                    )

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      }
                      else if (state is ProfileError){
                        Navigator.of(context).pushReplacementNamed('/');
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      else{
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                          child: Text(
                            'Клуб',
                            style: TextStyle(color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,),
                          )),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
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
                                  const EdgeInsets.fromLTRB(0, 0, 6, 0),
                                  width: (MediaQuery.of(context).size.width * 0.95-6*2)/3,
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
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 136,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Theme.of(context).colorScheme.surfaceContainer,
                      ),
                      child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
                        if (state is ProfileLoading){
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        else if (state is ProfileLoaded && (state).club != null &&
                            (state).proms != null){
                          final club = (state).club;
                          final proms = (state).proms;
                          if (club != null && proms != null){
                            return Center(
                              child: tabChoice(
                                  current, club,proms),
                            );
                          }
                          else{
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          }
                        }
                        else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllCoachView(),
                        ),
                      );
                    },
                    child: Container(
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
                    ),
                  ),

                  Container(
                    height: 10,
                  )

                   */
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: GACRules.navBarType == 0 ?
        BottomNavBar(0, context) : null,
      drawer: GACRules.navBarType == 1 ?
        DrawerNavBar(0, context): null,
      );
  }
  Future<void> _dialogBuilder(BuildContext context, String params) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Запись онлайн'),
          content: const Text(
            'Вы можете записаться на групповые занятия и подать заявку на персональный тренинг.',

          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,

                  ),
                  child: const Text('Групповые\nзанятия',
                    textAlign: TextAlign.center,),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/shedule');
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: Text(params == 'заявка'?'Занятия\nс персональным\nтренером':params,
                    textAlign: TextAlign.center,),
                  onPressed: () {
                    if (params == 'заявка'){
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestView(),
                        ),
                      );
                    }
                    else{
                      Navigator.of(context).pop();
                    }



                  },
                ),
              ],
            ),


          ],
        );
      },
    );
  }

}
