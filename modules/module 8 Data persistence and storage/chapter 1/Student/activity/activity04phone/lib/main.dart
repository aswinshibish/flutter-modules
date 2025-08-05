import 'package:activity04phone/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( ContactManagerApp());
}

class ContactManagerApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'contact manager',
      home:ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  
  @override
 _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  void _addContact(){
    String name='';
    String phone ='';  
    
    showDialog(context: context,
    builder: (context){
      return AlertDialog(
        title: Text('Add contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name'
              ),
              onChanged: (value) => name=value,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone'
              ),
              onChanged: (value) => phone=value,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: ()=>Navigator.pop(context),
           child: Text('Cancel')
           ),
           ElevatedButton(onPressed: ()async{
            if(name.isNotEmpty && phone.isNotEmpty){
              await FirebaseFirestore.instance.collection('contacts').add({
                'name':name,
                'phone':phone,
                'timestamp':FieldValue.serverTimestamp(),
              });
            }
            Navigator.pop(context);
           }, child: Text('Update'),
           ),
        ],
      );

    }
    );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(' contact Manager'),
      ),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection('contacts').orderBy('timestamp', descending: true).snapshots(),
       builder: (context, AsyncSnapshot<QuerySnapshot>snapshot){
        if (!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var contacts= snapshot.data!.docs;
        return contacts.isEmpty
        ? Center(child: Text('No contacts yet.'))
        : ListView.builder(
          itemCount: contacts.length,
          itemBuilder:(context, index){
            var contact =contacts[index];
            return Card(
              child: ListTile(
                title: Text(contact['name']),
                subtitle: Text(contact['phone']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: ()async{
                      await FirebaseFirestore.instance.collection('contacts').doc(contact.id).delete();
                    }, icon: Icon(Icons.delete,color: Colors.red,))
                  ],
                ),
              ),
            );
          } );
       }),

       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
        onPressed: _addContact),
    );
  }
}