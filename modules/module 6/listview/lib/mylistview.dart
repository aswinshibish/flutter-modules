import 'package:flutter/material.dart';

class Mylistview extends StatefulWidget {
  const Mylistview({super.key});

  @override
  State<Mylistview> createState() => _MylistviewState();
}

class _MylistviewState extends State<Mylistview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View'),),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
            onTap: (){

            },
          ),
           ListTile(
            leading: Icon(Icons.photo),
            title: Text('Album'),
            onTap: (){

            },
          ),
           ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
            onTap: (){

            },
          ),

        ],
      ),
    );
  }
}