import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googlemy/firebase_options.dart';
import 'package:googlemy/first.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myfirst(),
  ));
}

