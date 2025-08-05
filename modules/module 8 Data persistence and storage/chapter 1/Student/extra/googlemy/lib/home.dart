import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlemy/first.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.brown,
        centerTitle: true,
        title: Text('HOME', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('You are signed in!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
             SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
              textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              onPressed: ()async{
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Myfirst()));

            }, child:  Text(' sign Out', ))
          ],
        ),
      ),
    );
  }
}