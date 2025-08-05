import 'package:flutter/material.dart';

class Activity1 extends StatefulWidget {
  const Activity1({super.key});

  @override
  State<Activity1> createState() => _Activity1State();
}

class _Activity1State extends State<Activity1> {
  final TextEditingController UsernameController=TextEditingController();
  final TextEditingController PasswordController=TextEditingController();

  String? UsernameError;
  String? PasswordError;

  String? validateUsername(String Username){
    if(RegExp(r'[!@#<>?":_~;[\]\\|=+(*&^%0-9-)]').hasMatch(Username)){
      return 'Username must not contain special characters or numbers';
    }
    if(Username.isEmpty){
      return 'username cannot be empty';
    }
    return null;
  }

  String? validatePassword(String Password){
    if (Password.length< 6){
      return 'password must be at least 6 characters long';
    }

    if(!RegExp(r'[A-Z]').hasMatch(Password)){
      return 'password must be at least one upercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(Password)){
      return 'password must be at least one number';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: 
            EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: UsernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: UsernameError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),

              onChanged: (value){
                setState(() {
                  UsernameError=validateUsername(value);
                });
              },
            ),
            ),
            SizedBox(height: 20),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: PasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: PasswordError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              onChanged: (value){
                setState(() {
                  PasswordError=validatePassword(value);
                });
              },
            ),
            ),
            SizedBox(height: 20,),
            
            ElevatedButton(onPressed: (){
              setState(() {
                UsernameError=validateUsername(UsernameController.text);
                PasswordError=validatePassword(PasswordController.text);
              });
              if(UsernameError==null && PasswordError==null){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login Successful!')));
              }
            },
            child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}