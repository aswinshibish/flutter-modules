import 'package:circular_menu/circular_menu.dart';
import 'package:flotting/limy.dart';
import 'package:flutter/material.dart';




class Flower extends StatefulWidget {
  @override
  _FlowerState createState() => _FlowerState();
}

class _FlowerState extends State<Flower> {
  String _colorName = 'No';
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Flutter Circular Menu'),
        ),
        body: CircularMenu(
          alignment: Alignment.bottomCenter,
          backgroundWidget: Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 28),
                children: <TextSpan>[
                  TextSpan(
                    text: _colorName,
                    style:
                        TextStyle(color: _color, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' button is clicked.'),
                ],
              ),
            ),
          ),
          toggleButtonColor: Colors.pink,
          items: [
            CircularMenuItem(
                icon: Icons.home,
                color: Colors.green,
                onTap: () {
                  setState(() {
                    _color = Colors.green;
                    _colorName = 'Green';
                  });
                }),
            CircularMenuItem(
                icon: Icons.search,
                color: Colors.blue,
                onTap: () {
                  setState(() {
                    _color = Colors.blue;
                    _colorName = 'Blue';
                  });
                }),
            CircularMenuItem(
                icon: Icons.settings,
                color: Colors.orange,
                onTap: () {
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const test()),
  );
                }),
            CircularMenuItem(
                icon: Icons.chat,
                color: Colors.purple,
                onTap: () {
                  setState(() {
                    _color = Colors.purple;
                    _colorName = 'Purple';
                  });
                }),
            CircularMenuItem(
                icon: Icons.notifications,
                color: Colors.brown,
                onTap: () {
                  setState(() {
                    _color = Colors.brown;
                    _colorName = 'Brown';
                  });
                })
          ],
        ),
      ),
    );
  }
}