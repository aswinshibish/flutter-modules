import 'package:flutter/material.dart';
 
class Mylistviewbuilder extends StatefulWidget {
  const Mylistviewbuilder({super.key});

  @override
  State<Mylistviewbuilder> createState() => _ListviewbuilderState();
}

class _ListviewbuilderState extends State<Mylistviewbuilder> {
  List<String>products=['limy','ardra','dona'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student name'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: ( context,  index,) {

            return Text(products[index]);
          }),
    );
  }
}