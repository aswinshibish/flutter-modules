import 'package:flutter/material.dart';

class my_not extends StatefulWidget {
  const my_not({super.key});

  @override
  State<my_not> createState() => _my_notState();
}

class _my_notState extends State<my_not> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[400],
        title: Text('Notification'),
        centerTitle: true,
      ),
      body:    Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.notifications),
              trailing: Icon(Icons.delete),
              title: Text('Notification 1'),
              
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.notifications),
              trailing: Icon(Icons.delete),
              title: Text('Notification 1'),
             
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.notifications),
              trailing: Icon(Icons.delete),
              title: Text('Notification 1'),
             
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.notifications),
              trailing: Icon(Icons.delete),
              title: Text('Notification 1'),
             
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.notifications),
              trailing: Icon(Icons.delete),
              title: Text('Notification 1'),
             
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.notifications),
              trailing: Icon(Icons.delete),
              title: Text('Notification 1'),
             
            ),
          ),
        )
         ],),
    );
  }
}