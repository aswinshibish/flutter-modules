import 'package:flutter/material.dart';

class Exercise3 extends StatefulWidget {
  const Exercise3({super.key});

  @override
  State<Exercise3> createState() => _Exercise3State();
}

class _Exercise3State extends State<Exercise3> {

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
  void dispose() {
    UsernameController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    // Perform submission logic here
    print("Username: ${UsernameController.text}");
    print("Password: ${PasswordController.text}");
  }

  void _clear() {
    setState(() {
      UsernameController.clear();
      PasswordController.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fluttre Textfield Example'),
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: UsernameController,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: UsernameError,
                border: OutlineInputBorder()
              ),
              onChanged: (value){
                setState(() {
                  UsernameError=validateUsername(value);
                });
              },
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: PasswordController,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: PasswordError,
                border: OutlineInputBorder()
              ),
               onChanged: (value){
                setState(() {
                  PasswordError=validatePassword(value);
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: _submit, child: Text('submit'),
              ),
              ElevatedButton(onPressed: _clear, child: Text('clear'))
            ],
          ),
          
        ],
      ),
    );
  }
}