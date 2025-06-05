import '/home/cubit/home_cubit.dart';
import '/home/view/coach_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/bottom_nav_bar.dart';



class AllCoachView extends StatefulWidget {
  const AllCoachView({Key? key}) : super(key: key);

  //static Route<void> route() {
    //return MaterialPageRoute<void>(builder: (_) => const TrainerView());
  //}
  @override
  State<AllCoachView> createState() => _AllCoachViewState();
}

class _AllCoachViewState extends State<AllCoachView> {

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Наши тренеры', style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 24,
              ),), ],
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
                  height: (coachItems!.length * 75 * 2),
                  child: ListView(
                    primary: false,
                    children: List.generate(coachItems.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => CoachDetailView(coach: coachItems[index]),
                          //   ),
                          // );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                          padding: EdgeInsets.fromLTRB(16, 24, 16, 20),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromRGBO(40, 45, 49, 1),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  coachItems[index].description,
                                ),
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(coachItems[index].description),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(coachItems[index].fullName.toString(), style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 12,
                                      ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      alignment: Alignment.centerLeft,
                                      child: Center(
                                        child: Text(coachItems[index].specialization.toString(), style: TextStyle(
                                          color: Color.fromRGBO(124, 124, 124, 1),
                                          fontSize: 14,
                                        ),
                                          overflow: TextOverflow.visible,
                                          maxLines: 4,
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
}
