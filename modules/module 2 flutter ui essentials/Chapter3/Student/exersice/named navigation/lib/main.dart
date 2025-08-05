import 'package:exercise2/myecercise2.dart';
import 'package:exercise2/myprofile.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Myecercise2(),
      '/details': (context) => const DetailsScreen(),
      '/set': (context) => Myprofile(),
      
    },
    )
  );
}