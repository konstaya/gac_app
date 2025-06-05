import 'package:flutter/material.dart';

class CoachDetail extends StatelessWidget {
  final coach;
  const CoachDetail({required this.coach});

  int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month || (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мой тренер'),
        backgroundColor: Color.fromRGBO(24, 28, 31, 1),
        elevation: 0,
      ),
      backgroundColor: Color.fromRGBO(24, 28, 31, 1),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.93,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width * 0.93,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image.network(coach.urlPhoto
                ),
              ) ?? Image.asset('assets/photo.png'),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                alignment: Alignment.topLeft,
                child: Text(
                  coach.fullName,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Возраст: " + calculateAge(DateTime.parse(coach.birthDate)).toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(102, 102, 102, 1),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Образование",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        coach.education,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Специализация",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 60,
                      child: Text(
                        coach.specialization,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
