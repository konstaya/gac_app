import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainerDetailView extends StatelessWidget {
  final trainer;
  const TrainerDetailView({required this.trainer});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 28, 31, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 28, 31, 1.0),
        title: Text(trainer.name, style: TextStyle(
            color: Color.fromRGBO(216, 216, 216, 1.0),
            fontSize: 24,
            fontWeight: FontWeight.w600,),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                height: 210,
                child: Image.asset('assets/imagenone.png', fit: BoxFit.contain,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Тип тренажера:',
                    style: TextStyle(fontSize: 22, color: Colors.blue, fontWeight: FontWeight.w500),),
                  Container(
                    height: 24,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(39, 136, 236, 1),
                        borderRadius: BorderRadius.circular(21)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          trainer.type.toString(),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  Text('Мышцы:',
                    style: TextStyle(fontSize: 22, color: Colors.blue, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Container(

                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Row(
                  children: [
                    Text(trainer.muscles.toString(), textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20, color: Colors.white30),),
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  Text('Описание:',
                    style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Container(

              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Row(
                  children: [
                    Text(trainer.description.toString(), textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, color: Colors.white30),),
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  Text('Методические рекомендации:',
                    style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Container(

                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Row(
                  children: [
                    Text(trainer.guidelines.toString(), textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20, color: Colors.white30),),
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(104, 172, 234, 1.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ))),
                onPressed: () {
                  launchUrl(Uri.parse(trainer.youtubeUrl));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Посмотреть видео',
                      style: TextStyle(
                        color: Color.fromRGBO(40, 45, 49, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      // <-- Icon
                      Icons.chevron_right,
                      size: 20.0,
                      color: Color.fromRGBO(40, 45, 49, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
