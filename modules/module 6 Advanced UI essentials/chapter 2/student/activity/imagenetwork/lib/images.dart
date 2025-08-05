import 'package:flutter/material.dart';

class Imagess extends StatefulWidget {
  const Imagess({super.key});

  @override
  State<Imagess> createState() => _ImagesState();
}

class _ImagesState extends State<Imagess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text('Image network'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          height: 450,
          width: 300,child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB6jQH76Aqx2EmQaDmxPhhwQWC3tys6xFyOg&s"),
        ),
      ),

    );
  }
}