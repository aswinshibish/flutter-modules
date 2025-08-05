import 'package:flutter/material.dart';
import 'package:navigation/screentwo.dart';

class Mynavigation extends StatefulWidget {
  const Mynavigation({super.key});

  @override
  State<Mynavigation> createState() => _MynavigationState();
}

class _MynavigationState extends State<Mynavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.blue,
        title: Text(
          "First route",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              Navigator.push(context,
               MaterialPageRoute(builder: (context)=>Screentwo()),);
            },
            child: Text(
              "open route",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}