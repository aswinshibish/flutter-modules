import 'package:flutter/material.dart';

class mygride extends StatefulWidget {
  const mygride({super.key});

  @override
  State<mygride> createState() => _mygrideState();
}

class _mygrideState extends State<mygride> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Padding(padding: EdgeInsets.all(8.0),
      child: GridView.builder(gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
      itemBuilder: (context,index){
        var xIndex= index % 8;
        var yIndex=(index/8).floor();
        return Container(
          color: (xIndex+yIndex).isEven?Colors.black:Colors.white,
          child: Stack(children: [],),
        );
      } ),),
    );
  }
}