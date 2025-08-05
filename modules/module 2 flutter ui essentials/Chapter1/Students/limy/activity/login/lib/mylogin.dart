import 'package:flutter/material.dart';

class Mylogin extends StatelessWidget{
  Mylogin({super.key});

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
                 Text('Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                
                 Container(
                  alignment: Alignment.topLeft,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 30.0),
                     child: Text('Name',
                                     style: TextStyle(color: Colors.black,
                                     fontSize: 15),),
                   ),
                 ),
                 Padding(padding: EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  width: 350,
                  
                  child: TextField(
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )
                    ),
                  ),
                ),),
                Container(
                  alignment: Alignment.topLeft,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 30.0),
                     child: SizedBox(
                      
                       child: Text('Email',
                                       style: TextStyle(color: Colors.black,
                                       fontSize: 15),),
                     ),
                   ),
                 ),
                  Padding(padding: EdgeInsets.only(bottom: 0.0),
                child: SizedBox(
                  width: 350,
                  
                  
                  child: TextField(
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )
                    ),
                  ),
                ),),
                Container(
                  alignment: Alignment.topLeft,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 30.0),
                     child: SizedBox(
                      width: 100,
                      
                      
                       child: Padding(
                         padding: const EdgeInsets.only(top: 35.0),
                         child: Text('Password',
                                         style: TextStyle(color: Colors.black,
                                         fontSize: 15),),
                       ),
                     ),
                   ),
                 ),
                  Padding(padding: EdgeInsets.only(bottom: 0.0),
                child: SizedBox(
                  width: 350,
                  
                  
                  child: TextField(
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )
                    ),
                  ),
                ),),
                Padding(
                  padding: const EdgeInsets.only(right: 250.0),
                  child: TextButton(onPressed:(){},
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text('forgot password?',
                  style: TextStyle(
                    fontSize: 10,
                  ),),
                ),
              ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(left: 150.0),
                   child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 50),
                        backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                                   ),
                 ),


                

            ],
          ),
        ),
      )
     ],), 
    );
}}