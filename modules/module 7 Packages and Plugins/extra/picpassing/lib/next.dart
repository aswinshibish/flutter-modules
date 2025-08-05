import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:picpassing/screen2.dart';

class Next extends StatefulWidget {
  const Next({super.key});

  @override
  State<Next> createState() => _NextState();
}

class _NextState extends State<Next> {
  String _currentAnimation = "asset/tick.json";

    void _changeAnimation(String animationAsset) {       //WHEN ONE BUTTON SELECT ANIMATION SHOULD BE SELECT
    setState(() {
      _currentAnimation = animationAsset;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Center( // Centering the animation
               child: Lottie.asset(
          _currentAnimation,
          height: 800,
          width: 300,
               ),
             ),
             const SizedBox(height: 40),
             Center( // Centering the Row
               child: Row(
          mainAxisSize: MainAxisSize.min, // Ensuring minimal width
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _changeAnimation("asset/tick.json");
                 Navigator.push(context, 
                   MaterialPageRoute(builder: (context)=>Screen2(
                   
                   ),),);
              },
             
            ),
          ],
               ),
             ),
           ],
         ),
       ),
    );
  }
}