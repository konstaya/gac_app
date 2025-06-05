import '../../constructor/config.dart';
import '../../constants/drawer_nav_bar.dart';
import '/trainer/cubit/trainer_cubit.dart';
import '/trainer/view/trainer_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/bottom_nav_bar.dart';

class TrainerView extends StatefulWidget {
  const TrainerView({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const TrainerView());
  }

  @override
  State<TrainerView> createState() => _TrainerViewState();
}

class _TrainerViewState extends State<TrainerView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TrainerCubit>(context).fetchData();
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
            Text('Тренажеры', style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 24,
            ),),
            Icon(Icons.info_outline, color: Color.fromRGBO(255, 255, 255, 1),)
          ],
        )
      ),
      body: BlocBuilder<TrainerCubit, TrainerState>(
          builder: (context, state){
            if (state is TrainerLoading){
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }else if (state is TrainerLoaded && (state).trainerItems != null){
              final trainerItems = (state).trainerItems;
              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: (trainerItems!.length * 75 * 2),
                    child: ListView(
                      primary: false,
                      children: List.generate(trainerItems.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => TrainerDetailView(trainer: trainerItems[index]),
                            //   ),
                            // );
                            launchUrl(Uri.parse(trainerItems[index].youtubeUrl));
                          },
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Color.fromRGBO(40, 45, 49, 1),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Container(
                                  //   width: 100,
                                  //   height: 100,
                                  //   child: Image.asset('assets/imagenone.png', fit: BoxFit.contain,),
                                  // ),
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                      trainerItems[index].imageUrl.toString(),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(trainerItems[index].imageUrl.toString()),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(trainerItems[index].name.toString(), style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                fontSize: 16,
                                              ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            // Container(
                                            //   alignment: Alignment.centerLeft,
                                            //   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                            //   child: Container(
                                            //     width: 100,
                                            //     height: 24,
                                            //     decoration: BoxDecoration(
                                            //         color: Color.fromRGBO(39, 136, 236, 1),
                                            //         borderRadius: BorderRadius.circular(14)),
                                            //     child: Center(
                                            //       child: Text(trainerItems[index].type.toString(), style: TextStyle(
                                            //         color: Color.fromRGBO(255, 255, 255, 1),
                                            //         fontSize: 16,
                                            //       ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              );
            }else{
              return Center(child: const Text('Error'),);
            }
          }
      ),
      bottomNavigationBar: GACRules.navBarType == 0 ?
        BottomNavBar(2, context) : null,
      drawer: GACRules.navBarType == 1 ?
        DrawerNavBar(2, context): null,
    );
  }
}
