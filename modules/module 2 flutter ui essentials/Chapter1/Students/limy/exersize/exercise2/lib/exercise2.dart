import 'package:flutter/material.dart';

class Exercise2 extends StatelessWidget{
  Exercise2({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Image(image: AssetImage('images/cat.png')),
                ),
                Text('Create your account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                Text('Create an account so you can manage your personal finances',
                style: TextStyle(color: Colors.black,
                fontSize: 10),),
                Padding(padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Your Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),),
                Padding(padding: EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: 'Enter Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      
                    )
                  ),
                ),),
                Padding(padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 50),
                      backgroundColor: Colors.blue),
                  onPressed: () {},
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text('Sign up with',
                style: TextStyle(color: Colors.black,
                fontSize: 15),),
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
                 Text('Aleart have an account ?',
                style: TextStyle(color: Colors.black,
                fontSize: 15),
                ),
                TextButton(onPressed:(){},
                child: Text('signup'),
              ),

              

              ],
            ),
          ),
        )
      ],

      )
      
      
      
    );}
}