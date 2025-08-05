import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newauthenticat/home.dart';
import 'package:newauthenticat/signup.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  bool _obscureText = true;

  Future<void>_login()async{
    try{
      await _auth.signInWithEmailAndPassword(
        email:_emailController.text.trim(),
        password: _passwordController.text.trim()
        );
        Navigator.pushReplacement(context
        , MaterialPageRoute(builder: (context)=>Myhome()));
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar
      (content:Text('Login Failed:${e.toString()}')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor:  Colors.lightBlue,
        centerTitle: true,
        title: Text('LOGIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                  obscureText: _obscureText,
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
                  ),
              ),

              SizedBox(
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.lightBlue 
                      ),
                      onPressed:  _login,
                      child:Text(
                            "Login",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                    ),
                 ),

                 SizedBox(height: 20),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Mysighup()),);
                  }, child: Text("Dont't have an account? Sign Up"))
                 ],
      ),
    );
  }
}