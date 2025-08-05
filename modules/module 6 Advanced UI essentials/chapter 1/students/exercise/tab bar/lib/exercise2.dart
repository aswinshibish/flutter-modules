import 'package:flutter/material.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _Exercise2State();
}

class _Exercise2State extends State<Exercise2> {
  @override
  Widget build(BuildContext context) {
    return
    DefaultTabController(length: 3, child:Scaffold(appBar:
     
    AppBar(
      title: Text('Bottom sheet sample'),
      centerTitle: true,
      backgroundColor: Colors.orange,
      bottom: TabBar(tabs: 
      [
        Tab(
          icon: Icon(Icons.chat),
          text: 'chats',
        ),
        Tab(icon: Icon(Icons.call),
        text: 'calls',),
        Tab(
          icon: Icon(Icons.settings),
          text: 'settings',
        )
      ]),
      
    ),
    
    body: TabBarView(children:[ Container(child: Center(
      child: Text('chat tab',style: TextStyle(color: Colors.black),),
    ),),
    
     Container(child: Center(
      child: Text('calls',style: TextStyle(color: Colors.black),),
    ),),
     Container(child: Center(
      child: Text('settings',style: TextStyle(color: Colors.black),),
    ),)]),),
    
    
    );
  } 
}