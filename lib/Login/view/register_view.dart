import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String _email = '';
  String _password = '';
  String _name = '';
  var dateFieldController = TextEditingController();
  DateTime selectedDate = DateTime.parse('2000-01-01');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Column(
        children: [
          Container(
            height: min(261, 280),
            width: MediaQuery.of(context).size.width,
            //decoration: BoxDecoration(
            //  image: DecorationImage(
            //    image: AssetImage('assets/welcbgrt2.png'),
            //    fit: BoxFit.fitWidth,
            //  ),
            //),
            child: Center(
              child: Container(
                width: 216,
                height: 124,
                child: Image.asset('assets/logosplash2.png'),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextFormField(
                              style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
                              decoration: InputDecoration(
                                labelText: 'Адрес электронной почты',
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: 'Введите адрес электронной почты',
                                hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer.withValues(alpha: 0.5), fontSize: 18),
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextFormField(
                              style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
                              decoration: InputDecoration(
                                labelText: 'ФИО',
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: 'Введите ваше имя',
                                hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer.withValues(alpha: 0.5), fontSize: 18),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                              ),

                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Пожалуйста, введите ваше ФИО';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _name = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextField(
                              style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
                              controller: dateFieldController,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Дата рождения',
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: 'Введите дату рождения',
                                hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer.withValues(alpha: 0.5), fontSize: 18),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                              ),
                              onTap: () {
                                // DatePicker.showDatePicker(
                                //   context,
                                //   showTitleActions: true,
                                //   minTime: DateTime(1960),
                                //   maxTime: DateTime(2016),
                                //   onConfirm: (selectedDate) {
                                //     setState(() {
                                //       this.selectedDate = selectedDate;
                                //       dateFieldController.text =
                                //           DateFormat('yyyy-MM-dd').format(selectedDate);
                                //       Future.delayed(Duration(milliseconds: 1200));
                                //     });
                                //   },
                                //   currentTime: selectedDate ?? DateTime.now(),
                                //   locale: LocaleType.en,
                                // );
                              },
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextFormField(
                              style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
                              decoration: InputDecoration(
                                labelText: 'Пароль',
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: 'Введите пароль',
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer.withValues(alpha: 0.5), fontSize: 18),

                              ),
                              obscureText : true,
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
                      SizedBox(height: 100.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.primaryContainer,),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(37.0),
                                  )
                              )
                          ),
                          onPressed: () async {
                            if (_email.isNotEmpty && _password.isNotEmpty && _name.isNotEmpty && dateFieldController != null) {
                              Future<String> _register() async{
                                String ur = 'https://vladixks.ru/api/v1/register';
                                var url = Uri.parse(ur);
                                var body = jsonEncode({
                                  "username": _email,
                                  "password": _password,
                                  "full_name": _name,
                                  "birth_date": dateFieldController.text,
                                  "phone_number": "1234567890",
                                  "email": _email,
                                });
                                var response = await http.post(
                                    url,
                                    headers: {"Content-Type" : "application/json"},
                                    body: body
                                );
                                return response.statusCode.toString();
                              }
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
                                        Text('Подождите, идет регистрация'),
                                      ],
                                    ),
                                  );
                                },
                              );
                              String code = await _register();
                              Navigator.of(context).pop();
                              if (code == "201"){
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text('Уведомление'),
                                    content: Text('Ваш профиль успешно создан, дождитесь подтверждения администратора'),
                                  );
                                }
                                );
                              }
                              else{
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text('Упс...'),
                                    content: Text('Введите корректный адрес электронной почты'),
                                  );
                                }
                                );
                              }
                            }else{
                              showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('Что-то пропустили'),
                                  content: Text('Необходимо заполнить все поля'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop('/register');
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              }
                              );
                            }
                          },
                          child: Text('Зарегистрироваться',
                            style:
                            TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
