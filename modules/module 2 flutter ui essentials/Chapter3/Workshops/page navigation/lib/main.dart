import 'package:flutter/material.dart';
import 'package:workshop3/Named.dart';
import 'package:workshop3/setting.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
      '/details': (context) => const DetailsScreen(),
      '/set': (context) => Setting(),
      
    },
  ));
}
