import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget{
  Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          width: 350,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('LOGIN',
              style: TextStyle(
                color: Colors.green,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),),
              Padding(padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'user name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
              ),

              ),
              Padding(padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
              ),

              ),

               ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 50),
                      backgroundColor: Colors.green),
                  onPressed: () {},
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){},
                    color: Colors.blue,
                    iconSize: 40,
                    icon: Icon(Icons.facebook),),
                    IconButton(onPressed: (){},
                    color: Colors.blue,
                    iconSize: 40,
                    icon: Icon(Icons.mail),),
                    IconButton(onPressed: (){},
                    color: Colors.blue,
                    iconSize: 40,
                    icon: Icon(Icons.phone),),
                      ],
                ),
                Text('Aleart have an account',
                style: TextStyle(color: Colors.black,
                fontSize: 15),
                ),
                
               TextButton(onPressed:(){},
                child: Text('signup'),
              ),
              
            ]    
          ),
                
              
          ),),
          
        );
        
    

  
  }}