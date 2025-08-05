import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Myexercise1 extends StatefulWidget {
  const Myexercise1({super.key});

  @override
  State<Myexercise1> createState() => _Myexercise1State();
}

class _Myexercise1State extends State<Myexercise1> {

final TextEditingController myAnimatedTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANIMALS"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            colorizeAnimation(),
            rotateAnimation(),
            scaleAnimation(),
            fadeAnimation(),
            typeAnimation(),
          ],
        ),
      ),
    );
  }

  Widget colorizeAnimation() {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 30.0,
    );
    return Container(
      color: Colors.pinkAccent,
      height: 150,
      width: double.infinity,
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Dog',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
            ColorizeAnimatedText(
              'Goat',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
           
          ],
          repeatForever: true,
        ),
      ),
    );
  }

  Widget rotateAnimation() {
    const textStyle = TextStyle(
      fontSize: 30.0,
      color: Colors.white,
    );
    return Container(
      height: 150,
      color: Colors.yellow,
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            RotateAnimatedText(
              'Cat',
              textStyle: textStyle,
            ),
            RotateAnimatedText(
              'Hen',
              textStyle: textStyle,
            ),
            
          ],
          repeatForever: true,
        ),
      ),
    );
  }

  Widget scaleAnimation() {
    return Container(
      height: 150,
      color: Colors.blue,
      child: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 40.0,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              ScaleAnimatedText('Goat'),
              ScaleAnimatedText('Rabbit'),
              
            ],
            repeatForever: true,
          ),
        ),
      ),
    );
  }

  Widget fadeAnimation() {
    return Container(
      color: Colors.lightGreenAccent,
      height: 150,
      child: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText('Donkey'),
              FadeAnimatedText('Bird'),
             
            ],
            repeatForever: true,
          ),
        ),
      ),
    );
  }

  Widget typeAnimation() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.blueGrey,
      height: 150.0,
      child: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 20.0,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText('Duck'),
              TyperAnimatedText('Hourse'),
              
            ],
            repeatForever: true,
          ),
        ),
      ),
    );
  }
}