
import 'package:blood/firebase_options.dart';
import 'package:blood/myblood.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main()async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myblood(),
  ));
}

