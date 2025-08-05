import 'package:flutter/material.dart';

class Activity5 extends StatefulWidget {
  const Activity5({super.key});

  @override
  State<Activity5> createState() => _Activity5State();
}

class _Activity5State extends State<Activity5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text('prefix & suffix',style: TextStyle(color: Colors.white),),),
        body: Center(child: 
        TextField(
          decoration: InputDecoration(
             border: UnderlineInputBorder(),
             hintText: "Email",
             labelText: "Email",
             prefixIcon:
                 IconButton(onPressed: () {}, icon: Icon(Icons.email_rounded)),
             suffixIcon: IconButton(
               icon: Icon(Icons.arrow_drop_down_circle),
               onPressed: () {},
             ),
           ),
        ),),
    );
  }
}