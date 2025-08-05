
import 'package:flutter/material.dart';
import 'package:mini/mini.dart'; // Contains DBHelper and Note model

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
  final contentController = TextEditingController();

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
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      await DBHelper.insertNote(
        Note(title: titleController.text, content: contentController.text),
      );
      titleController.clear();
      contentController.clear();
      loadNotes();
    }
  }

  void updateNote(int id) async {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      await DBHelper.updateNote(id, titleController.text, contentController.text);
      titleController.clear();
      contentController.clear();
      loadNotes();
    }
  }

  void deleteNote(int id) async {
    await DBHelper.deleteNote(id);
    loadNotes();
  }

  void showUpdateDialog(int id, String currentTitle, String currentContent) {
    titleController.text = currentTitle;
    contentController.text = currentContent;

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
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Content'),
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
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Note App', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
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
                  subtitle: Text(notes[i].content),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.green),
                        onPressed: () {
                          showUpdateDialog(notes[i].id!, notes[i].title, notes[i].content);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteNote(notes[i].id!),
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
}
