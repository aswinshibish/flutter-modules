import 'package:flutter/material.dart';
import 'package:namechange/nextpage.dart';

class Myactivity extends StatefulWidget {
  
  const Myactivity({super.key});
  static const routeName='/Myactivity';

  @override
  State<Myactivity> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Myactivity> {
  final TextEditingController usernameController=TextEditingController();
   final TextEditingController passwordController=TextEditingController();
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
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        ),
                    ),
                    
                  ), ),
                  SizedBox(height: 20.0,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: passwordController,
                    
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        ),
                         ),),),
             ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  final username = usernameController.text;
                  
                  // Navigate to NextPage with arguments
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Nextpage(arguments: username),
                    ),
                  );
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

 