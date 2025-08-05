import 'package:flutter/material.dart';

class screenone extends StatefulWidget {
  const screenone({super.key});

  @override
  State<screenone> createState() => _screenoneState();
}

class _screenoneState extends State<screenone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('home page'),),
    drawer: Drawer(child: ListView(padding: EdgeInsets.zero,
    children: [DrawerHeader(
      decoration: BoxDecoration(color: Colors.blue),
      child: Text('drawer header',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),)),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('home'),
        onTap: (){
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text('profile'),
        onTap: (){
          Navigator.pop(context);
        },
      ),
      ],
    ),),
    
    );
  }
}