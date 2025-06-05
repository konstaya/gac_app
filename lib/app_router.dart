import 'dart:convert';

import '/Welcome/view/welcome_view.dart';
import '/home/home.dart';
import '/profile/profile.dart';
import '/schedule/view/schedule_view.dart';
import '/shop/shop.dart';
import '/trainer/trainer.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'Login/view/login_view.dart';
import 'Login/view/register_view.dart';

class AppRouter {
  bool _checkAuth(){
    final access = box.read('access') ?? '';
    final refresh = box.read('refresh') ?? '';
    final role = box.read('role') ?? '';
    print(access);
    print(refresh);
    print(role);
    if (access == '' && refresh == '' && role == ''){return true;}else{return false;}
  }

  void _updateToken() async{
    var url = Uri.parse('https://vladixks.ru/api/v1/token_refresh');
    var response = await http.post(
      url,
      body: {'refresh': box.read('refresh')},
    );
    print('update status:${response.statusCode}');
    box.write('access', json.decode(response.body)['access']);
    box.write('refresh', json.decode(response.body)['refresh']);
    box.write('role', json.decode(response.body)['role']);
    // await Future.delayed(Duration(milliseconds: 500));
  }

  void deauth(){
    box.remove('access');
    box.remove('refresh');
    box.remove('role');
    box.remove('club');
    box.remove('name');
    box.remove('id');
  }

  final box = GetStorage();

  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case '/':
        if (_checkAuth()){
          return UnanimatedPageRoute(builder: (_) => const WelcomeView());
        }else{
          return UnanimatedPageRoute(builder: (_) => const HomeView());
        }
      case '/login':
        return UnanimatedPageRoute(builder: (_) => const LoginView());
      case '/register':
        return UnanimatedPageRoute(builder: (_) => const RegisterView());
      case '/trainer':
        if (_checkAuth()){
          deauth();
          return UnanimatedPageRoute(builder: (_) => const WelcomeView());
        }else{
          return UnanimatedPageRoute(builder: (_) => const TrainerView());
        }
      case '/shop':
        if (_checkAuth()){
          deauth();
          return UnanimatedPageRoute(builder: (_) => const WelcomeView());
        }else{
          return UnanimatedPageRoute(builder: (_) => const ShopView());
        }
      case '/profile':
        if (_checkAuth()){
          deauth();
          return UnanimatedPageRoute(builder: (_) => const WelcomeView());
        }else{
          return UnanimatedPageRoute(builder: (_) => const ProfileView());
        }
      case '/home':
        if (_checkAuth()){
          deauth();
          return UnanimatedPageRoute(builder: (_) => const WelcomeView());
        }else{
          return UnanimatedPageRoute(builder: (_) => const HomeView());
        }
      case '/shedule':
        if (_checkAuth()){
          deauth();
          return UnanimatedPageRoute(builder: (_) => const WelcomeView());
        }else{
          return UnanimatedPageRoute(builder: (_) => const ScheduleView());
        }
    }
  }
}


class UnanimatedPageRoute<T> extends MaterialPageRoute<T> {
  UnanimatedPageRoute({
    required Widget Function(BuildContext) builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
    builder: builder,
    settings: settings,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
  );

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return child;
  }
}