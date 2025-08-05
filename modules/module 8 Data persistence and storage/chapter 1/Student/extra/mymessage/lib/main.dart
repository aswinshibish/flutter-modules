import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mymessage/firebase_options.dart';
import 'package:mymessage/first.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Myfirst() ,
  ));
}

