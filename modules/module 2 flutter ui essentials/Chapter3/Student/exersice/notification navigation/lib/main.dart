import 'package:exercise1/myexercise1.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
theme: ThemeData(
  scaffoldBackgroundColor: Colors.blue[100]
),

      home: homescreen(),
    )
  );
}