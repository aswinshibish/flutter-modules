import 'package:flutter/material.dart';
import 'package:workshop2/workshop2.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: Favorites2()
  ));
}
