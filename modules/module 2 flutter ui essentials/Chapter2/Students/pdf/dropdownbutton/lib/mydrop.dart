import 'package:flutter/material.dart';

class Mydrop extends StatefulWidget {
  const Mydrop({super.key});

  @override
  State<Mydrop> createState() => _MydropState();
}

class _MydropState extends State<Mydrop> {
  String? _selectedItem ='item 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: DropdownButton(value: _selectedItem,
        items: ['item 1','item 2','item 3','item 4']
        .map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }) .toList(),
        onChanged: (String? newValue){
          setState(() {
            _selectedItem=newValue;
          });
        } ),
        
        
      ),

    );
  }
}