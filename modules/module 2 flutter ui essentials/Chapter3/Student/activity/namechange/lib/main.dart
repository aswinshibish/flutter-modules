
import 'package:flutter/material.dart';
import 'package:namechange/myactivity.dart';

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData(
  scaffoldBackgroundColor: Colors.blue[100]
),
 
   
debugShowCheckedModeBanner: false,
home:const Myactivity() ,
    )
  );
}