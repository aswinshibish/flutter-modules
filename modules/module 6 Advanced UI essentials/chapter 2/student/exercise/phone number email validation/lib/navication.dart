import 'package:flutter/material.dart';

class Navication extends StatefulWidget {
  const Navication({super.key});

  @override
  State<Navication> createState() => NavicationState();
}

class NavicationState extends State<Navication> {
  TextEditingController _phonenumbercontroller =TextEditingController();
  TextEditingController _emailcontroller=TextEditingController();
  String? PhonenumberError;
  String? EmailError;

  String? validatePhonenumber(String Phonenumber){
    if (RegExp(r'^\d{11}$') .hasMatch(Phonenumber)){
      return'phone number must be exactly 10 digits';
      
    }
    
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




  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Edit Acount'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                maxRadius: 80,backgroundColor: Colors.black,
              ),
              Text('Change/Delete photo')
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(decoration: InputDecoration(
              labelText: 'Name',
              
              border: OutlineInputBorder(),
            ),
            
            ),
          ),
          SizedBox(height: 10,),
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
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _phonenumbercontroller,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(

                labelText: 'Phone number',
                errorText: PhonenumberError,
                border: OutlineInputBorder()
              ),
              onChanged: (value){
              setState(() {
                PhonenumberError=validatePhonenumber(value);
              });
            },
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Adress',
                border: OutlineInputBorder()            ),
            ),
          )
          
        ],
      ),
    );
  }
}