
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
     

  runApp(MyApp());
}
 
 class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactScreen(),
    );
  }
}

class ContactScreen extends StatefulWidget {
  
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final  TextEditingController _nameController = TextEditingController();
  final CollectionReference _contactRef = FirebaseFirestore.instance.collection('contacts');

   Future<void>_saveContact()async{
    String name =_nameController.text.trim();
    if(name.isNotEmpty){

      await _contactRef.add({'name':name});
      _nameController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("contact saved:$name")),
        );
    }
   }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('save contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter contact name'
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _saveContact, child: Text('Save Contact'),),
            SizedBox(height: 20,),

            Expanded(child: StreamBuilder<QuerySnapshot>(stream: _contactRef.snapshots(),
             builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                return Center(child: Text('No contacts saved'));
              }

              var contacts = snapshot.data!.docs;
                             return ListView.builder(
                              itemCount: contacts.length,
                              itemBuilder: (context, index){
                                var contact = contacts[index];
                                return ListTile(
                                  title: Text(contact['name']),
                                );
                              }
                             );
             }
             )
             )
          ],
        ),
      ),
    );
  }
}