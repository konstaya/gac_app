import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoachDetailView extends StatelessWidget{
  final coach;
  const CoachDetailView({required this.coach});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 28, 31, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 28, 31, 1.0),
        title: Text(coach.fullName, style: TextStyle(
          color: Color.fromRGBO(216, 216, 216, 1.0),
          fontSize: 24,
          fontWeight: FontWeight.w600,),
        ),
      ),
      body: Container(
        child: Column(children: [
          Text(coach.username.toString()),

      ]),
      ),
    );
  }
}