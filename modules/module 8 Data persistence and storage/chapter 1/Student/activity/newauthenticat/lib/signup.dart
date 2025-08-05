import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newauthenticat/login.dart';

class Mysighup extends StatefulWidget {
  const Mysighup({super.key});

  @override
  State<Mysighup> createState() => _MysighupState();
}

class _MysighupState extends State<Mysighup> {
   final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final FirebaseAuth _auth=FirebaseAuth.instance;
   bool _obscureText = false;

   Future<void> _signUp()async{
    try{
      await _auth.createUserWithEmailAndPassword(
        email:_emailController.text.trim(),
        password:_passwordController.text.trim()
      );
      Navigator.pushReplacement(context
        , MaterialPageRoute(builder: (context)=>Mylogin()));
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar
      (content:Text('Sign Up Failed:${e.toString()}')));
    }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor:  Colors.lightBlue,
        centerTitle: true,
        title: Text('SIGHNUP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
              keyboardType:TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
               border: OutlineInputBorder()
              ),
              
            ),
          ),
           SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                 controller: _passwordController,
                 decoration: InputDecoration(
                    labelText: 'Password',
                     border: const OutlineInputBorder(),
                     suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                  ),
                 obscureText: !_obscureText,
                  ),
              ),
               SizedBox(
                child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.lightBlue 
                      ),
                      onPressed: _signUp,
                      child:Text(
                            "Sighn up",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                    ),
                 ),
        ],
      ),
    );
  }
}