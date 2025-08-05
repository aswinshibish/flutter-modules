import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newauthenticat/login.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void>_logout(BuildContext context)async{
    await _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Mylogin()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor:  Colors.lightBlue,
        centerTitle: true,
        title: Text('HOME', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: ()=>_logout(context), icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}