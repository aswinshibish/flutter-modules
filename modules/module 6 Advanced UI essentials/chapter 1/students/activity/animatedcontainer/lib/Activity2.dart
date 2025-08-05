import 'package:flutter/material.dart';

class Activity2 extends StatefulWidget {
  const Activity2({super.key});

  @override
  State<Activity2> createState() => _Activity2State();
}

class _Activity2State extends State<Activity2> {
  bool _isMoved=false;
  bool _isLarge=false;
  void _togglePosition(){
    setState(() {
      _isMoved=!_isMoved;
      _isLarge=!_isLarge;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('AnimatedPositioned Example'), centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
               duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            left: _isMoved?200:50,
            top: _isMoved?400:50,
            child: GestureDetector(
              onTap:_togglePosition,
              child:AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _isLarge?150:100,
                height: _isLarge?150:100,
                color: Colors.blue,
                child: Center(
                  child: Text('tap me',
                  style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              )
            ))
          ],
        ),
      ),
    );
  }
}