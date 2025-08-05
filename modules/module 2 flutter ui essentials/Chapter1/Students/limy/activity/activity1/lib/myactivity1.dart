import 'package:flutter/material.dart';

class Myactivity1 extends StatelessWidget{
  Myactivity1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Center(
          child: Container(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(60),
                child: Image(image: AssetImage('images/pet1.jpg')),),
                Text('Hello',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                Text('Welcome To Little Drop,where you manage you daily tasks',
                style: TextStyle(color: Colors.black,
                fontSize: 10),),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(250, 40),
                        backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(250, 40),
                        ),
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text('Sign up using',
                                    style: TextStyle(color: Colors.black,
                                    fontSize: 15),),
                  ), 
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){},
                    color: Colors.blue,
                    iconSize: 40,
                    icon: Icon(Icons.facebook),),
                    IconButton(onPressed: (){},
                    color: Colors.red,
                    iconSize: 40,
                    icon: Icon(Icons.mail),),
                    IconButton(onPressed: (){},
                    color: Colors.black,
                    iconSize: 40,
                    icon: Icon(Icons.phone),),
                      ],
                ),

              ],
            ),
          ),
        )
      ],),

    );
}}