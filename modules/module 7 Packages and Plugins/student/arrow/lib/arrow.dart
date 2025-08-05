// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';


// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }
// class _MyPageState extends State<MyPage> {
//   /// Variables
//   File? imageFile;
//   XFile? PFile;

//   /// Widget
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Image Picker"),
//         ),
//         body: Container(
//             child: imageFile == null
//                 ? Container(
//               alignment: Alignment.center,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ElevatedButton(
                    
//                     onPressed: () {
//                       _getFromGallery();
//                     },
//                     child: Text("PICK FROM GALLERY"),
//                   ),
//                   Container(
//                     height: 40.0,
//                   ),
//                   ElevatedButton(
                    
//                     onPressed: () {
//                       _getFromCamera();
//                     },
//                     child: Text("PICK FROM CAMERA"),
//                   )
//                 ],
//               ),
//             ): Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                Image.file(
//                 imageFile!,
//                 fit: BoxFit.cover,
//               ),
//               ElevatedButton(
                    
//                     onPressed: (){Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => MyPage1()),
//   );},  
//                     child: Text("Choose Background Image"),
//                   ),
//                   // Container(
//                   //   height: 40.0,
//                   // ),
//               ]
//               )
//               ,
              
//             ),
//             ),
//             );
//   }

//   /// Get from gallery
//   _getFromGallery() async {
//     // ignore: deprecated_member_use
//     final XFile? pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//         PFile  = pickedFile;
//       });
//     }
//   }

//   /// Get from Camera
//   _getFromCamera() async {
//     final XFile? pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//         PFile  = pickedFile;
//       });
//     }
//   }
// }

// class MyPage1 extends StatefulWidget {
//   const MyPage1({super.key});

//   @override
//   State<MyPage1> createState() => _MyPage1State();
// }

// class _MyPage1State extends State<MyPage1> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Hiii',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20))
              )
            ),
           SizedBox(height: 30,),
            ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child: Text('Save',style: TextStyle(color: Colors.white),))
         ] )
    );
      
  }
}