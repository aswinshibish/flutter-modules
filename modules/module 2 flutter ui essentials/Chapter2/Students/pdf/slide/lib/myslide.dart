import 'dart:ffi';

import 'package:flutter/material.dart';

class Myslide extends StatefulWidget {
  const Myslide({super.key});

  @override
  State<Myslide> createState() => _MyslideState();
}

class _MyslideState extends State<Myslide> {

  double _sliderValue=10.0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Slider(value: _sliderValue,
         min: 0.0,
         max: 100.0,
         divisions: 100,
         label: _sliderValue.toStringAsFixed(0),
         onChanged: (double newValue) {
          setState((){
            _sliderValue=newValue;
          });
         }
      ),
      

    ),);
  }
}