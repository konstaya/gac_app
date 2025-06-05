import 'package:gac_app/constructor/config.dart';

import '/home/cubit/fetch_data_home.dart';
import '/home/cubit/home_cubit.dart';
import '/home/cubit/home_repository.dart';
import '/profile/cubit/club_repository.dart';
import '/profile/cubit/fetch_data_club.dart';
import '/profile/cubit/profile_cubit.dart';
import '/schedule/cubit/sch_cubit.dart';
import '/schedule/cubit/sch_fetch.dart';
import '/schedule/cubit/sch_repository.dart';
import '/shop/cubit/fetch_data.dart';
import '/shop/cubit/shop_cubit.dart';
import '/shop/cubit/shop_repository.dart';
import '/trainer/cubit/trainer_cubit.dart';
import '/trainer/cubit/trainer_repository.dart';
import '/trainer/cubit/fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';


class App extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  final FlexScheme flexScheme;
  final TextTheme textTheme;

  const App({
    Key ?key,
    required this.appRouter,
    required this.connectivity,
    required this.flexScheme,
    required this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrainerRepository trainerRepository = TrainerRepository(fetchData: FetchDataTrainer());
    ShopRepository shopRepository = ShopRepository(fetchData: FetchData());
    ClubRepository clubRepository = ClubRepository(fetchDataClub: FetchDataClub());
    SchRepository schRepository = SchRepository(trainingsData: SchFetchData());
    HomeRepository homeRepository = HomeRepository(fetchDataHome: FetchDataHome());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit(shopRepository),
        ),
        BlocProvider(
          create: (context) => TrainerCubit(trainerRepository),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(clubRepository),
        ),
        BlocProvider(
            create: (context) => SchCubit(schRepository),
        ),
        BlocProvider(
          create: (context) => HomeCubit(homeRepository),
        ),
      ],
      child: MaterialApp(
        title: 'GA',
        onGenerateRoute: appRouter.onGenerateRoute,
        theme: FlexThemeData.light(
            scheme: GACRules.colorScheme,
            textTheme: GACRules.textTheme,
        ),
      ),
    );
  }
}