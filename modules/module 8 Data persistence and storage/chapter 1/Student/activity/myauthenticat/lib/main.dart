import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myauthenticat/firebase_options.dart';
import 'package:myauthenticat/first.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myauthenticat(),
  ));
}

