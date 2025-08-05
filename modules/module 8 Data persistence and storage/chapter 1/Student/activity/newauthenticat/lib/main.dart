import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newauthenticat/firebase_options.dart';
import 'package:newauthenticat/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Mylogin() ,
  ));
}

