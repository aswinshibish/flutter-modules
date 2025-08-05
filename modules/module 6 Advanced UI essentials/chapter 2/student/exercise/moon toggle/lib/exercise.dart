import 'package:flutter/material.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _Exercise2State();
}

class _Exercise2State extends State<Exercise2> {
  bool isDarkThemeEnabled = false;

  IconData _icon = Icons.wb_sunny;
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: isDarkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 29, 193, 234),
              title: Text('Contatus'),
              actions: [
                IconButton(
                  icon: Icon(
                    _icon,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_icon == Icons.wb_sunny) {
                        _icon = Icons.brightness_2;
                        isDarkThemeEnabled = true;
                      } else {
                        _icon = Icons.wb_sunny;
                        isDarkThemeEnabled = false;
                      }
                    });
                  },
                ),
              ]),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Emai'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Massage'),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('submit'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300.0),
                child: Text('info'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300.0),
                child: Icon(Icons.mail),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300.0),
                child: Icon(Icons.phone),
              )
            ],
          ),
        )
        );
  }
}
