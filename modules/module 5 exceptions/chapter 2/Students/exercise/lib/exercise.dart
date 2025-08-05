import 'package:flutter/material.dart';

class myexercise extends StatefulWidget {
  const myexercise({super.key});

  @override
  State<myexercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<myexercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    
    Icon(Icons.message),
    Expanded(child: 
    Text('Lorem  ipsum dolor sit amet, consecteture adiilj elit ,sed do eimunous tempor including ut labour et magma aligue ad minimum venila, nostrud execution ullimma labour inisulin ut alique ex ea commodo condition')
      )]
) );
  }
}


    