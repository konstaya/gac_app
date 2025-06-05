import '/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembershipView extends StatelessWidget {

  const MembershipView();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(24, 28, 31, 1),
          appBar: AppBar(
            bottom: const TabBar(

                labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),  //For Selected tab
                unselectedLabelStyle: TextStyle( fontWeight: FontWeight.w400,),
                tabs: [
                  Tab(text: 'Абонементы'),
                  Tab(text: 'Услуги'),
                ]),
            elevation: 0,
            backgroundColor: Color.fromRGBO(24, 28, 31, 1),
            title: Text('Клубная карта',
              style: TextStyle(
                color: Color.fromRGBO(216, 216, 216, 1.0),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body:  TabBarView(
              children: [

                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state){
                              if (state is ProfileLoading){
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              }else if (state is ProfileLoaded && (state).myServices != null){
                                final myServices = (state).myServices;
                                var mem = [];
                                for (var elem in myServices!){
                                  if (elem.isMembership){
                                    mem.add(elem);
                                  }
                                }
                                return SingleChildScrollView(
                                  child: Container(
                                    height: (mem.length * 170 * 2),
                                    child: ListView(
                                      primary: false,
                                      children: List.generate(mem.length, (index) {
                                        return Container(
                                          margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                                          width: MediaQuery.of(context).size.width * 0.95,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(14),
                                            color: Color.fromRGBO(40, 45, 49, 1),
                                          ),
                                          child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(mem[index].name,
                                                    style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),),
                                                  Container(
                                                    height: 24,
                                                    padding: EdgeInsets.only(left: 4, right: 4),
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(39, 136, 236, 1),
                                                        borderRadius: BorderRadius.circular(21)),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          //mem[index].price.toString()+' ₽',
                                                          mem[index].visits.toString(),
                                                          style: const TextStyle(
                                                            color: Color.fromRGBO(40, 45, 49, 1),
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width*0.85,
                                                child: Text(mem[index].description.toString(),
                                                  style: TextStyle(fontSize: 16, color: Colors.white30),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 8),
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                                                    children: [
                                                      Text('Количество посещений:',
                                                        style: TextStyle(fontSize: 18, color: Colors.white),),
                                                      Text(mem[index].currentVisits.toString(),
                                                        style: TextStyle(fontSize: 16, color: Colors.white),),
                                                    ]
                                                ),
                                              ),
                                            ],
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
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state){
                              if (state is ProfileLoading){
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              }else if (state is ProfileLoaded && (state).myServices != null){
                                final myServices = (state).myServices;
                                print(myServices.toString());
                                var ser = [];
                                for (var elem in myServices!){
                                  if (!elem.isMembership){
                                    ser.add(elem);
                                  }
                                }
                                if (ser.isNotEmpty){
                                  return SingleChildScrollView(
                                    child: Container(
                                      height: (ser.length * 170 * 2),
                                      child: ListView(
                                        primary: false,
                                        children: List.generate(ser.length, (index) {
                                          return Container(
                                            margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                                            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                                            width: MediaQuery.of(context).size.width * 0.95,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(14),
                                              color: Color.fromRGBO(40, 45, 49, 1),
                                            ),
                                            child:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(ser[index].name,
                                                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),),
                                                    Container(
                                                      height: 24,
                                                      padding: EdgeInsets.only(left: 4, right: 4),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(39, 136, 236, 1),
                                                          borderRadius: BorderRadius.circular(21)),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            //ser[index].price.toString()+' ₽',
                                                            ser[index].visits.toString(),
                                                            style: const TextStyle(
                                                              color: Color.fromRGBO(40, 45, 49, 1),
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context).size.width*0.85,
                                                  child: Text(ser[index].description.toString(),
                                                    style: TextStyle(fontSize: 16, color: Colors.white30),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top: 16),
                                                  child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                                                      children: [
                                                        Text('Количество посещений:',
                                                          style: TextStyle(fontSize: 18, color: Colors.white),),
                                                        // Text(ser[index].isAct.toString()+' посещения',
                                                        //   style: TextStyle(fontSize: 16, color: Colors.white30),),
                                                        Text(ser[index].currentVisits.toString(),
                                                          style: TextStyle(fontSize: 16, color: Colors.white),),
                                                      ]
                                                  ),
                                                ),
                                              ],
                                            ),

                                          );
                                        }),
                                      ),
                                    ),
                                  );
                                }
                                else {
                                  return Container(
                                    margin: EdgeInsets.only(top: 32),
                                      child: Center(
                                        child:
                                        const Text('Нет активных услуг',
                                          style: TextStyle(fontSize: 16, color: Colors.white30),
                                        )
                                      )
                                  );
                                }

                              }else{
                                return Center(child: const Text('Error'),);
                              }
                            }
                        ),
                      )
                    ],
                  ),
                ),
              ]),


        ),
      ),
    );
  }
}
