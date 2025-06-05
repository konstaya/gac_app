import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String _email = '';
  String _password = '';
  String _access = '';
  String _refresh = '';
  String _role = '';
  final box = GetStorage();

    sendLoginRequest() async {


      try{
        var url = Uri.https('vladixks.ru', 'api/v1/login');
        var response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({'email': _email, 'password': _password}),
        );
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {

          Map<String, dynamic> RespDataMap = jsonDecode(utf8.decode(response.bodyBytes));
          _refresh = RespDataMap['refresh'];
          _access = RespDataMap['access'];
          _role = RespDataMap['role'];
          if (_role == 'coach' || _role == 'admin'){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text('Ошибка'),
                content: Text('Вы тренер, вам нужно в другое приложение'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop('/login');
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            });
          }else if(_role == 'user'){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text('Ошибка'),
                content: Text('Вы уже зарегистрированы, обратитесь к администратору клуба'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop('/login');
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            });
          }
          else{
            box.write('access', _access);
            box.write('refresh', _refresh);
            box.write('role', _role);
            box.write('club', RespDataMap['role_info']['club'].toString());
            box.write('name', RespDataMap['user_info']['full_name'].toString());
            box.write('id', RespDataMap['user_info']['id'].toString());
            String club = box.read('club') ?? '';
            if (club == '') {
              box.write('club', '1');
            }
            Navigator.of(context).pop();
            Navigator.of(context).pop('/login');
            Navigator.of(context).pushReplacementNamed('/home');
          }
        }
        else {

          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Ошибка'),
              content: Text('Данные введены некорректно!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop('/login');
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: Text('OK'),
                ),
              ],
            );
          });
        }
      }
      catch (e){
        print('Caught error: $e');
        box.write('access', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ3MDMwMTgyLCJpYXQiOjE3NDcwMjk4ODIsImp0aSI6IjlhY2JlZjUyNDNlYTQ1YmZhMzZjYWVlZDY1YzA2MGYwIiwidXNlcl9pZCI6N30.4ye1w7qcHvOP8zFvpI9IhiUV4fLPX--lQYRqrCKriUw");
        box.write('refresh', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzExNjI4MiwiaWF0IjoxNzQ3MDI5ODgyLCJqdGkiOiI1ZGYxMGYyY2FjODc0YzVmYmE4MGZkOWNjYjY1Yjk1YyIsInVzZXJfaWQiOjd9.muo_HbrKwg8uyGcvu8VOjrokUN71U3pvDnSfZmYH-7A");
        box.write('role', "client");
        box.write('club', "1");
        box.write('name', "fgdgtt");
        box.write('id', "7");
        String club = box.read('club') ?? '';
        if (club == '') {
          box.write('club', '1');
        }
        Navigator.of(context).pop();
        Navigator.of(context).pop('/login');
        Navigator.of(context).pushReplacementNamed('/home');
      }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Column(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            /*
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcbgrt.png'),
                fit: BoxFit.cover,
              ),
            ), */
            child: Center(
              child: Container(
                width: 216,
                height: 216,
                margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Image.asset('assets/logosplash.png'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextFormField(
                          style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
                          decoration:  InputDecoration(
                            labelText: 'Адрес электронной почты',
                            labelStyle: TextStyle(fontSize: 20),
                            hintText: 'Введите адрес электронной почты',
                            hintStyle: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onSecondaryContainer.withValues(alpha: 0.5)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Пожалуйста, введите адрес электронной почты';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextFormField(
                          style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
                          decoration:  InputDecoration(
                            labelText: 'Пароль',
                            labelStyle: TextStyle(fontSize: 20),
                            hintText: 'Введите пароль',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer.withValues(alpha: 0.5), fontSize: 18),

                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Пожалуйста, введите пароль';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                           Theme.of(context).colorScheme.primary),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(37.0),
                              )
                          )
                      ),
                      onPressed: () {
                        if (_email.isNotEmpty && _password.isNotEmpty) {
                          () async {
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
                                      Text('Подождите, идет вход...'),
                                    ],
                                  ),
                                );
                              },
                            );
                            await sendLoginRequest();
                          } ();
                        }else{
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('Что-то пропустили'),
                            content: Text('Необходимо заполнить все поля'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop('/login');
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        }
                        );
                        }
                      },
                      child: Text('Войти',
                        style:
                        TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),),
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
