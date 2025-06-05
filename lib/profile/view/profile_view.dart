import 'dart:convert';

import 'package:gac_app/constructor/config.dart';

import '../../constants/drawer_nav_bar.dart';
import '/profile/cubit/profile_cubit.dart';
import '/profile/view/all_membership_view.dart';
import '/profile/view/membership_view.dart';
import '/profile/view/my_schedule_view.dart';
import '/profile/view/notification_view.dart';
import '/trainer/trainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import '/constants/text_style.dart';
import '/constants/clubs.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../constants/bottom_nav_bar.dart';
import 'my_trainer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfileView());
  }
}

class _ProfileViewState extends State<ProfileView> {
  final box = GetStorage();
  @override void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).fetchDataClub();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Container(
            margin: EdgeInsets.only(top: 20),
            child: getTextStyle('Профиль', 24, FontWeight.w700, [Theme.of(context).colorScheme.onSurface],)),
      ),
      body:
      BlocBuilder<ProfileCubit, ProfileState>(builder: (context,state){
        if (state is ProfileLoading){
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        else if (state is ProfileError){
          Navigator.of(context).pushReplacementNamed('/profile');
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        else if (state is ProfileLoaded && (state).services != null && (state).coachInfo != null){
          final services = (state).services;
          final myServices = (state).myServices;
          final mycoach = (state).coachInfo;
          print(services.toString());
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    box.read('name').toString(),
                    style:  TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withAlpha(90),
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MembershipView(),
                      ),
                    );
                  },
                  child:
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    height: 56,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Мой абонемент',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('')],
                      ),
                    ),
                  ),

                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyScheduleView(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    //height: 56,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(16, 4, 4, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Мое расписание',
                            style: TextStyle(
                              color: Color.fromRGBO(24, 28, 31, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Управляй своим расписанием',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(80),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (mycoach != null && mycoach.isNotEmpty){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoachDetail(coach: mycoach[0]),
                        ),
                      );
                    }
                    else{
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('Уведомление'),
                          content: Text('У вас нет тренера'),
                        );
                      }
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    height: 56,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(16, 4, 4, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Мой тренер',
                            style: TextStyle(
                              color: Color.fromRGBO(24, 28, 31, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 16, top: 20),
                  child:  Text(
                    GACRules.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, top: 0),
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
                        return Row(
                          children: [
                            Text(
                              club[0].name.toString(),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                          ),
                          ]
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
                  }
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child:
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainer
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllMembershipView(name: box.read('name').toString(), services: services),
                          ),
                        );
                      },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            'Абонементы и услуги',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondaryContainer.withAlpha(90),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            // <-- Icon
                            Icons.chevron_right,
                            size: 22.0,
                            color: Theme.of(context).colorScheme.onSecondaryContainer.withAlpha(90),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Container(
                //    margin: EdgeInsets.only(left: 16, top: 8),
                //    child:
                //    const Text(
                //      'Настройки приложения',
                //      style: TextStyle(
                //        color: Color.fromRGBO(48, 129, 213, 1.0),
                //        fontWeight: FontWeight.w600,
                //        fontSize: 22,
                //      ),
                //    )
                //),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
                  child:
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationView(),
                          ),
                        );
                      },
                      child:
                       Container(
                         padding: EdgeInsets.all(8),
                         child: Row(
                           children: [
                             Text(
                              'Уведомления',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondaryContainer.withAlpha(90),
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                                                   ),
                           ],
                         ),
                       )
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
                  child:
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainer
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse('https://drive.google.com/file/d/162HQ3Tdk0m1wahP7ZJa1w-cZqaTjHduV/view?usp=sharing'));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text(
                              'Пользовательское соглашение',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondaryContainer.withAlpha(90),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              // <-- Icon
                              Icons.chevron_right,
                              size: 22.0,
                              color: Theme.of(context).colorScheme.onSecondaryContainer.withAlpha(90),
                            ),
                          ],
                        ),
                      ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: TextButton(
                      onPressed: () {
                        box.remove('access');
                        box.remove('refresh');
                        box.remove('role');
                        box.remove('id');
                        box.remove('club');
                        box.remove('name');
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                        overlayColor: Theme.of(context).colorScheme.error
                      ),
                      child: Text(
                        'Выйти из приложения',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 86, 86, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )),
                ),
              ],
            ),
          );
        }
        else{
          return Center(child: const Text('Error'),);
        }
      }),
      bottomNavigationBar: GACRules.navBarType == 0 ?
        BottomNavBar(4, context) : null,
      drawer: GACRules.navBarType == 1 ?
        DrawerNavBar(4, context): null,
    );
  }
}
