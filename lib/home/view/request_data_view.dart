import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RequestDataView extends StatelessWidget{
  final coach;
  const RequestDataView({required this.coach});


  @override
  Widget build(BuildContext context) {
    var aw = '1';
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 28, 31, 1),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(24, 28, 31, 1),
          title: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Создание заявки 2 шаг:', style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 24,
                ),),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Добавьте описание', style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 20, fontWeight: FontWeight.w400,
                ),),
              ),
            ],
          )
      ),
      body: Column(
        children:[
          Center(
            child: Container(
            width: 358,
            //height: 136,
            margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Color.fromRGBO(40, 45, 49, 1),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Тренер:',style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20, fontWeight: FontWeight.w500,
                        ),),
                        Text(coach.fullName,style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20, fontWeight: FontWeight.w300,
                        ),),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 4, 16, 0),
                    alignment: Alignment.topLeft,
                    child: Text('Описание:',style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20, fontWeight: FontWeight.w500,
                    ),),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(16, 4, 16, 16),
                      alignment: Alignment.topLeft,
                      child: Text('укажите в какие дни и время вам удобно тренироваться, '
                          'а также пожелания к тренировкам',style: TextStyle(
                      color: Colors.white30,
                    fontSize: 16, fontWeight: FontWeight.w400,
                        ),
                      )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
                    child: TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Укажите время и дни тренировок здесь ',
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      onChanged: (text) {
                        // Do something with the text input
                        aw = text;
                      },
                      onSubmitted: (text) {
                        // Do something when the user submits the text input
                        aw = text;
                      },
                      maxLength: 150,
                      obscureText: false,
                        maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () async {
                Future<String> edit() async {
                  final box = GetStorage();
                  try {
                    final String token = 'Bearer ${box.read('access')}';
                    final url = Uri.parse('https://gapptest.ru/api/v1/personal_request_c');

                    var body = jsonEncode({
                      'client': box.read('id'),
                      'coach': coach.id,
                      'is_accept': false,
                      'time_start': '2023-06-14',
                      'description': aw,
                    });
                    final response = await http.post(
                      url,
                      headers: {"Authorization" : token, "Content-Type": "application/json"},
                      body: body,
                    );
                    print('-----requests profile upd:' +  response.statusCode.toString());
                    print(response.body.toString());
                    return response.statusCode.toString();
                  } catch (e) {
                    return '-----requests profile upd error:$e';
                  }
                };
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
                await edit();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                //Navigator.of(context).pop('/home');
                //Navigator.of(context).pushReplacementNamed('/home');

              },
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                height: 44,
                width: 358,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: Color.fromRGBO(39, 136, 236, 1),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Отправить заявку',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ]
      ),
    );
  }
}