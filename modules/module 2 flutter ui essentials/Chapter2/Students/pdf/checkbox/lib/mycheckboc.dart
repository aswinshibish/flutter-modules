import 'package:flutter/material.dart';

class Mycheckboc extends StatefulWidget {
  const Mycheckboc({super.key});

  @override
  State<Mycheckboc> createState() => _MycheckbocState();
}

class _MycheckbocState extends State<Mycheckboc> {
bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(value: isChecked,
             onChanged: (bool? value){
              setState(() {
                isChecked=value?? false;
              });
             }),
             Text('check me'),
          ],
        ),
      ),
    );
  }
}

