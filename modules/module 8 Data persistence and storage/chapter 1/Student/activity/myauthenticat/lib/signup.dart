import 'package:flutter/material.dart';

class Mysignup extends StatefulWidget {
  const Mysignup({super.key});

  @override
  State<Mysignup> createState() => _MysignupState();
}

class _MysignupState extends State<Mysignup> {
  final TextEditingController passwordController = TextEditingController();
  TextEditingController _emailcontroller=TextEditingController();
 String? passwordError;
  String? EmailError;

  String? validatePassword(String password) {
    if (password.length < 6) return 'Password must be at least 6 characters long';
    if (!RegExp(r'[A-Z]').hasMatch(password)) return 'Password must have at least one uppercase letter';
    if (!RegExp(r'[0-9]').hasMatch(password)) return 'Password must have at least one number';
    return null;
  }

  String? validateEmail(String email){
    if (email.length< 6){
      return 'email must be at least 6 characters long';
    }
    if(! RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)){
      return 'email must be at least one upercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(email)){
      return 'email must be at least one number';
    }
    return null;
  }
   bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor:  Colors.lightBlue,
        centerTitle: true,
        title: Text('SIGNUP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),

      body: Column(
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: EmailError,

                border: OutlineInputBorder()
              ),
              onChanged: (value){
                setState(() {
                  EmailError=validateEmail(value);
                });
              },
            ),
          ),

          SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: passwordError,
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
                 
                  onChanged: (value) {
                    setState(() {
                      passwordError = validatePassword(value);
                    });
                  },
                ),
              ),

              SizedBox(
                 
                  child: ElevatedButton(
                   style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                    onPressed: () {
                      setState(() {
                        
                        EmailError = validateEmail(_emailcontroller.text);
                        passwordError = validatePassword(passwordController.text);
                      });

                      if (passwordError == null &&
                          EmailError == null 
                          ) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Registered successfully")),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                  ),
                ),
        ],
      ),
 
    );
  }
}