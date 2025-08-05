import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blood/myblood.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mysplach extends StatefulWidget {
  const Mysplach({super.key});

  @override
  State<Mysplach> createState() => _MysplachState();
}

class _MysplachState extends State<Mysplach> {

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 7),(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_)=>const Myblood(),)
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
       backgroundColor: const Color.fromARGB(255, 120, 27, 20),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
  width: 200.0,
  child: Center(
    child: TextLiquidFill(
      text: 'BLOOD',
      waveColor: Colors.white,
      boxBackgroundColor: const Color.fromARGB(255, 100, 12, 12),
      textStyle: TextStyle(
        fontSize: 70.0,
        fontWeight: FontWeight.bold,
      ),
      boxHeight: 300.0,
    ),
  ),
)
            
          ],
        ),
      ),
      
    );
    


  }
}