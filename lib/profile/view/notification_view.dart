import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {

  const NotificationView();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 28, 31, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 28, 31, 1.0),
        title: Text('Уведомления',
          style: TextStyle(
          color: Color.fromRGBO(216, 216, 216, 1.0),
          fontSize: 24,
          fontWeight: FontWeight.w600,),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Center(

            child: Text('В следующей версии будет настройка уведомлений :)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue),
                textAlign: TextAlign.center)
        ),
      ),
    );
  }
}