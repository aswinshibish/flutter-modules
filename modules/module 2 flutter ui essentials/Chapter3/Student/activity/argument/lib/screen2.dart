import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final String? Username;
  Screen2({this.Username});
 

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text('${widget.Username}'
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('welcom \n ${widget.Username}'
         
        ),
      ),
    );
  }
}