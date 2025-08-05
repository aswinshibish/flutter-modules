import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
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
  final DatabaseReference _contactRef = FirebaseDatabase.instance.ref().child('contacts');


  

   Future<void>_saveContact()async{
    
    String name =_nameController.text.trim();
    if(name.isNotEmpty){

      await _contactRef.push().set({'name':name});
      _nameController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("contact saved:$name")),
        );
    }
   }

   void _showEditDialog(String key, String currentName) {
  final TextEditingController _editController = TextEditingController(text: currentName);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Edit Contact'),
        content: TextField(
          controller: _editController,
          decoration: InputDecoration(
            labelText: 'Enter new name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              String newName = _editController.text.trim();
              if (newName.isNotEmpty) {
                await _contactRef.child(key).update({'name': newName});
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Updated contact: $newName")),
                );
              }
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
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

            Expanded(child: StreamBuilder<DatabaseEvent>(
              stream: _contactRef.onValue,
             builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }if(snapshot.hasData && snapshot.data!.snapshot.value!=null){
                Map<dynamic,dynamic>contacts=
                snapshot.data!.snapshot.value as Map<dynamic,dynamic>;

                List<MapEntry<dynamic,dynamic>>contactList =contacts.entries.toList();
               

                 return ListView.builder(
                              itemCount: contactList.length,
                              itemBuilder: (context, index){
                                var contact = contactList[index];
                                var key = contact.key; 
                                var name = contact.value['name'];

                                
                                return ListTile(
                                  title: Text(contact.value['name']),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
  onPressed: () {
    _showEditDialog(contact.key, contact.value['name']);
  },
  icon: Icon(Icons.edit, color: Colors.blue),
),
                                       IconButton(
            onPressed: () async {
              await _contactRef.child(key).remove();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Deleted contact: $name")),
              );
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
                                    ],
                                  ),
                                );
                              }
                             );
              }else{
                return Center(child: Text('No contacts saved.'),);
              }

             
                            
             }
             )
             )
          ],
        ),
      ),
    );
  }
}



