import 'package:flutter/material.dart';

class Ac extends StatefulWidget {
  const Ac({super.key});

  @override
  State<Ac> createState() => _AcState();
}

class _AcState extends State<Ac> {

  final TextEditingController phoneNumberController=TextEditingController();

  String? phoneNumberError;

  String? validatePhoneNumber(String phoneNumber){
    if(!RegExp(r'^\d{10}$').hasMatch(phoneNumber)){
      return 'phone number must be exactly 10 digits';    }
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
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: 
            EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: phoneNumberError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),

              onChanged: (value){
                setState(() {
                  phoneNumberError=validatePhoneNumber(value);
                });
              },
            ),
            ),
           
            SizedBox(height: 20,),
            
            ElevatedButton(onPressed: (){
              setState(() {
                phoneNumberError=validatePhoneNumber(phoneNumberController.text);
                
              });
              if(phoneNumberError==null ){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('submission Successful!')));
              }
            },
            child: Text('submit'),
            )
          ],
        ),
      ),
      
    );
  }
}