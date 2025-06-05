import '/home/cubit/home_cubit.dart';
import '/home/view/coach_detail_view.dart';
import '/home/view/request_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/bottom_nav_bar.dart';



class RequestView extends StatefulWidget {
  //const TrainerView({Key? key}) : super(key: key);

  //static Route<void> route() {
  //return MaterialPageRoute<void>(builder: (_) => const TrainerView());
  //}
  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).fetchDataHome();
  }

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 28, 31, 1),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(24, 28, 31, 1),
          title: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Создание заявки 1 шаг:', style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 24,
                ),),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Выберете тренера', style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 20, fontWeight: FontWeight.w400,
                ),),
              ),
            ],
          )
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state){
            if (state is HomeLoading){
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }else if (state is HomeLoaded && (state).allCoach!= null){
              final coachItems = (state).allCoach;
              return SingleChildScrollView(
                child: Container(
                  height: (coachItems!.length * 170 * 2),
                  child: ListView(
                    primary: false,
                    children: List.generate(coachItems.length, (index) {
                      return GestureDetector(
                        onTap: () => _dialogBuilder(context, coachItems[index]),

                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                          padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromRGBO(40, 45, 49, 1),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.asset('assets/coach.png', fit: BoxFit.contain,),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(30, 5, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(coachItems[index].fullName.toString(), style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 22,
                                      ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Center(
                                        child: Text('тренер', style: TextStyle(
                                          color: Color.fromRGBO(124, 124, 124, 1),
                                          fontSize: 16,
                                        ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              );
            }else{
              return Center(child: const Text('Error'),);
            }
          }
      ),
    );
  }
  Future<void> _dialogBuilder(BuildContext context, var coach) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Вы уверены?'),
          content:  Text(
            'Вы выбрали:\n' + coach.fullName.toString(),

          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,

                  ),
                  child: const Text('ДА',
                    textAlign: TextAlign.center,),
                  onPressed:() {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RequestDataView(coach: coach),
                    ),
                  );
                },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('НЕТ',
                    textAlign: TextAlign.center,),
                  onPressed: () {
                    Navigator.of(context).pop();
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
