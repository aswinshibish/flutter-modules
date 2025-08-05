import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workshop2/splashscreen.dart';

class Splashscreen2 extends StatefulWidget {
  const Splashscreen2({super.key});

  @override
  State<Splashscreen2> createState() => _Splashscreen2State();
}

class _Splashscreen2State extends State<Splashscreen2> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3),(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_)=>const HomeScreen(),)
    );});
  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Icon(Icons.favorite,
            size: 80,
            color: Colors.white,),
            Text('limy',style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
      
    );
  }
}