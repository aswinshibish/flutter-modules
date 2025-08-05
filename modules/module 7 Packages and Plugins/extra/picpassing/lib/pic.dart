
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picpassing/screen2.dart';

class Pic extends StatefulWidget {
  const Pic({super.key});

  @override
  State<Pic> createState() => _PicState();
}

class _PicState extends State<Pic> {
  final dataMap =<String,int>{ };
  String? Username;
  String? Price;
  bool isAdult=false;

  ImagePicker _picker=ImagePicker();
  XFile? file;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Argument',style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
       body: SingleChildScrollView(
         child: Column(
          
           children: [
            SizedBox(height: 20,),
          Container(
            height: 300,
            width: 300,
            color: Colors.grey,
            child: Center(
              child: file == null
                  ? GestureDetector(
                      child: IconButton(
                        onPressed: () async {
                          final XFile? photo = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            file = photo;
                          });
                          print('image picked');
                        },
                        icon: Icon(Icons.add_a_photo_outlined),
                      ),
                    )
                  : ClipRRect(
                      child: Image.file(
                        File(file!.path),
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          SizedBox(height: 20,),
             
              Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20.0),
                 child: TextField(
                  
                   decoration: InputDecoration(
                     labelText: 'Username',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0),
                       ),
                   ),
                   onChanged: (val)=>Username=val,
                   
                 ), ),

                  SizedBox(height: 20,),
             
              Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20.0),
                 child: TextField(
                  
                   decoration: InputDecoration(
                     labelText: 'Price',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0),
                       ),
                   ),
                   onChanged: (val)=>Price=val,
                   
                 ), ),
                  SizedBox(height: 20,),
                  
            ElevatedButton(
               style: ElevatedButton.styleFrom(backgroundColor:  Colors.brown),
               onPressed: () {
                 
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>Screen2(
                 Username:Username,
                 Price: Price,
                  imagePath: file?.path,
                ),),);
                 
               },
           child: Text(
             "Login",
             style: TextStyle(color: Colors.white),
           )),
           ],
         ),
       ),
    );
  }

 
}

 
  