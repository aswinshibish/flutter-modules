
import 'package:flutter/material.dart';
import 'package:namesql/screen2.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> users = [];
  final TextEditingController nameController = TextEditingController();
  String? usernameError;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  String? validateUsername(String username) {
    if (RegExp(r'[!@#<>?":_~;[\]\\|=+(*&^%0-9-)]').hasMatch(username)) {
      return 'Username must not contain special characters or numbers';
    }
    if (username.isEmpty) {
      return 'Username cannot be empty';
    }
    return null;
  }

  void fetchUsers() async {
    List<Map<String, dynamic>> fetchedUsers = await dbHelper.getUsers();
    if (mounted) {
      setState(() {
        users = fetchedUsers;
      });
    }
  }

  void addUser() async {
    setState(() {
      usernameError = validateUsername(nameController.text);
    });

    if (nameController.text.isNotEmpty && usernameError == null) {
      await dbHelper.insertUser(nameController.text);
      nameController.clear();
      fetchUsers();
    }
  }

  void updateUser(int id) async {
    setState(() {
      usernameError = validateUsername(nameController.text);
    });

    if (nameController.text.isNotEmpty && usernameError == null) {
      await dbHelper.updateUser(id, nameController.text);
      nameController.clear();
      fetchUsers();
    }
  }

  void deleteUser(int id) async {
    await dbHelper.deleteUser(id);
    fetchUsers();
  }

  void showUpdateDialog(int id, String currentName) {
    nameController.text = currentName;
    usernameError = null;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Update User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: usernameError,
              ),
              onChanged: (value) {
                setState(() {
                  usernameError = validateUsername(value);
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              updateUser(id);
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
        title: Text('Name', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: usernameError,
              ),
              onChanged: (value) {
                setState(() {
                  usernameError = validateUsername(value);
                });
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: addUser,
              child: Text('Add User'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    child: ListTile(
                      title: Text(user['name']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              showUpdateDialog(user['id'], user['name']);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              deleteUser(user['id']);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
