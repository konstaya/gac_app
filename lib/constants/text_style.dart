import 'package:flutter/material.dart';

Widget getTextStyle(String data, size, weight, color) {
  if (color.length == 1){
    return Text(
      data,
      style: TextStyle(
        fontSize: size.toDouble(),
        fontWeight: weight,
        color: color[0],
      ),
    );
  }
  return Text(
    data,
    style: TextStyle(
      fontSize: size.toDouble(),
      fontWeight: weight,
      color: Color.fromRGBO(color[0], color[1], color[2], color[3].toDouble()),
    ),
  );
}
