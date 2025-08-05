import 'package:flutter/material.dart';

class Myexercise1 extends StatefulWidget {
  const Myexercise1({super.key});

  @override
  State<Myexercise1> createState() => _Myexercise1State();
}

class _Myexercise1State extends State<Myexercise1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3
    , child:  Scaffold(
       appBar: AppBar(
        bottom: TabBar(
          tabs:[
            Tab(icon: Icon(Icons.home),),
            Tab(icon: Icon(Icons.chat_rounded),),
            Tab(icon: Icon(Icons.settings),),
          ]),
        
       
        title: Padding(
          padding: const EdgeInsets.only(left:150.0),
          child: Text(
            "Home",
           
          ),
        ),
        backgroundColor:  Colors.grey,
        
        
        
        
        
        
      ),
      
      
      body: TabBarView(children:[
        Container(
          color: Colors.green,
          child: Center(
            child: Text('home screen',
            style: TextStyle(color: Colors.black),),
          ) 
        ),
        Container(
          color: Colors.blue,
          child:Center(
            child: Text('search screen',
              style: TextStyle(color: Colors.black),),
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Center(
            child: Text('setting screen',
              style: TextStyle(color: Colors.black),),
          ),
        ),
      ]
       ) 
      
    ),);
  }
}