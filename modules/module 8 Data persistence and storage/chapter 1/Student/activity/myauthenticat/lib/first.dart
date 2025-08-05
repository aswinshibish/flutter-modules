import 'package:flutter/material.dart';
import 'package:myauthenticat/home.dart';
import 'package:myauthenticat/signup.dart';

class Myauthenticat extends StatefulWidget {
  const Myauthenticat({super.key});

  @override
  State<Myauthenticat> createState() => _MyauthenticatState();
}

class _MyauthenticatState extends State<Myauthenticat> {
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
        title: Text('AUTHENTICATION', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Myhome()),);
                      }
                    },
                    child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                  ),
                ),
                 SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Mysignup()),);
                        },
                        child: Text(
                          "Sighnup",
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
        ],
      ),

    );
  }
}