import 'package:flutter/material.dart';

class Myradiobutton extends StatefulWidget {
  const Myradiobutton({super.key});

  @override
  State<Myradiobutton> createState() => _MyradiobuttonState();
}

class _MyradiobuttonState extends State<Myradiobutton> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('choose an option:'),
          SizedBox(height: 10),
          
           RadioListTile<int>(
            title: Text('option 1'),
            value: 1,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
           RadioListTile<int>(
            title: Text('option 2'),
            value: 2,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
          
        ],
      ),
    );
  }
}
