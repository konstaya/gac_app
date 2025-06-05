import 'package:flutter/material.dart';

class OfferView extends StatelessWidget {

  const OfferView();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оферта'),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('тут будет текст оферты')
          ),
        ],
      ),
    );
  }
}
