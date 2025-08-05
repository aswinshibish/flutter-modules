import 'package:flutter/material.dart';

class Mytabbar extends StatefulWidget {
  const Mytabbar({super.key});

  @override
  State<Mytabbar> createState() => _MytabbarState();
}

class _MytabbarState extends State<Mytabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
    child:Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        
        bottom: TabBar(
          tabs:[
            Text('tab1'),
            Text('tab2')
          ]),
        title: Text(
          "TabBar",
         
        ),
        backgroundColor:  Colors.yellow,
        ),
      body:TabBarView(children:[
        Center(
          child: Text('content for tab 1',style: TextStyle(fontSize: 40),),

        ),
         Center(
          child: Text('content for tab 2',style: TextStyle(fontSize: 40),),

        ),
         ]
    ),),);
  }
}