import 'package:flutter/material.dart';

class myfont extends StatefulWidget {
  const myfont({super.key});

  @override
  State<myfont> createState() => _myfontState();
}

class _myfontState extends State<myfont> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('limy',style: TextStyle(fontSize: 50,
            fontFamily: 'Chokokutai'),),
            Text('limy',style: TextStyle(fontSize: 50,
            fontFamily: 'AtomicAge'),),
            
            
          ],
        ),
      ),
    );
  }
}