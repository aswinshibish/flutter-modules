import 'package:argument/screen2.dart';
import 'package:flutter/material.dart';

class Myargument extends StatefulWidget {
  const Myargument({super.key});

  @override
  State<Myargument> createState() => _MyargumentState();
}

class _MyargumentState extends State<Myargument> {
  final dataMap =<String,int>{ };
  String? Username;
  bool isAdult=false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 250.0),
          child: Column(
            children: [
               Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                   
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        ),
                    ),
                    onChanged: (val)=>Username=val,
                    
                  ), ),
                   SizedBox(height: 20.0,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    
                    
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        ),
                         ),),),
             ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  
                 Navigator.push(context, 
                 MaterialPageRoute(builder: (context)=>Screen2(
                  Username:Username
                 ),),);
                  
                },
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            )),
            ],
          ),
        ),
      ),
    );
  }

 
}

 
  