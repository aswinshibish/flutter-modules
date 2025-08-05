import 'dart:io';

import 'package:flutter/material.dart';
import 'package:picpassing/next.dart';

class Screen2 extends StatefulWidget {
  final String? Username;
  final String? Price;
  final String? imagePath;
  Screen2({this.Username,this.imagePath,this.Price});
 

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Next page'
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
             SizedBox(height: 20,),
             widget.imagePath != null
              ? Image.file(
                  File(widget.imagePath!), // Display image
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                )
              : Text("No image selected"),
            
           Text('\n ${widget.Username}',style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(height: 20,),
           Text('\n ${widget.Price}',style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
             ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor:  Colors.brown),
                  onPressed: () {
                    
                   Navigator.push(context, 
                   MaterialPageRoute(builder: (context)=>Next(
                   
                   ),),);
                    
                  },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              )),
          ],
        ),
      ),
    );
  }
}