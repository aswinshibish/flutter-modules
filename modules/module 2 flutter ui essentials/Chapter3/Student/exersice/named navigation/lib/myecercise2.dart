import 'package:flutter/material.dart';

class Myecercise2 extends StatefulWidget {
  const Myecercise2({super.key});

  @override
  State<Myecercise2> createState() => _Myecercise2State();
}

class _Myecercise2State extends State<Myecercise2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 83, 97, 103),
          centerTitle: true,
          title: const Text('Home Page')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 162, 229, 165)),
              onPressed: () {
                Navigator.pushNamed(context, '/details', );
              },
              child: const Text(
                'Notification',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: ElevatedButton( 
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 185, 108, 134)),
                onPressed: () {
                Navigator.pushNamed(context, '/set');
                },
                child: const Text(
                  'Profile',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green[100],
          title: const Text('Notifiaction')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back to Home Page',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}