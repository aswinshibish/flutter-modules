
import 'package:contactsql/screen2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: NoteApp()));
}

class NoteApp extends StatefulWidget {
  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  List<Note> notes = [];
  final titleController = TextEditingController();
  List<Map<String, String>> contacts = [];

  String? phoneNumberError;
 
  String? validatePhoneNumber(String phoneNumber) {
    if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      return 'phone number must be exactly 10 digits';
    }
    return null;
  }
 
  void loadNotes() async {
    final data = await DBHelper.getNote();
    setState(() {
      notes = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  void addNote() async {
    if (titleController.text.isNotEmpty ) {
      setState(() {
        String contact = titleController.text.trim();
         contacts.add({ 'contact': contact});
      });
      await DBHelper.insertNote(
        Note(title: titleController.text,),
      );
      titleController.clear();
      
      loadNotes();
    }
  }

  // Move this inside _NoteAppState class
Future<void> _launchPhone(String phone) async {
  final Uri phoneLaunchUri = Uri(
    scheme: 'tel',
    path: phone,
  );
  if (!await launchUrl(phoneLaunchUri)) {
    throw 'Could not launch $phoneLaunchUri';
  }
}


  void updateNote(int id) async {
    if (titleController.text.isNotEmpty ) {
      await DBHelper.updateNote(id, titleController.text);
      titleController.clear();
     
      loadNotes();
    }
  }

  void deleteNote(int id) async {
    await DBHelper.deleteNote(id);
    loadNotes();
  }

  void showUpdateDialog(int id, String currentTitle, ) {
    titleController.text = currentTitle;
   

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Update Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
           
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              updateNote(id);
              Navigator.pop(context);
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 118, 19),
        title: Text('Note App', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              keyboardType:TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(labelText: 'Phone'),
              onChanged: (value) {
                setState(() {
                  phoneNumberError = validatePhoneNumber(value);
                });
              },
            ),
            
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color.fromARGB(255, 233, 118, 19),
                foregroundColor: Colors.white,
              ),
              onPressed: addNote,
              child: Text('Add Note'),
            ),
           Expanded(
  child: ListView.builder(
    itemCount: notes.length,
    itemBuilder: (ctx, i) => ListTile(
      title: Text(notes[i].title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.green),
            onPressed: () {
              showUpdateDialog(notes[i].id!, notes[i].title);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => deleteNote(notes[i].id!),
          ),
          IconButton(
            icon: Icon(Icons.phone, color: Colors.blue),
            onPressed: () => _launchPhone(notes[i].title), // <== Use phone number
          ),
        ],
      ),
    ),
  ),
),

          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index]['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index]['contact']!),
          ],
        ),
        trailing: IconButton(
          // Changed to call the stored contact number
          onPressed: () => _launchPhone(contacts[index]['contact']!), // <-- Changed line
          icon: const Icon(Icons.phone),
        ),
      ),
    );
  }
}

