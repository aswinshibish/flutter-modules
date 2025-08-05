import 'package:exercise1/mynotification.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const my_not()),
  );

          }, icon: Icon(Icons.notifications))
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50,top: 8),
                child: Image.asset('images/photo5.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset('images/photo2.jpg'),
              ),
              Image.asset('images/photo4.jpg'),
               Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset('images/photo2.jpg'),
              ),
               Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('images/photo2.jpg'),
          ),
          
            ],
          ),
        ],
      ),
    );
  }
}