import 'package:actsql/second.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

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
  final TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUsers();
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
    if (nameController.text.isNotEmpty && ageController.text.isNotEmpty) {
      await dbHelper.insertUser(nameController.text, int.parse(ageController.text));
      nameController.clear();
      ageController.clear();
      fetchUsers();
    }
  }

  void updateUser(int id) async {
    if (nameController.text.isNotEmpty && ageController.text.isNotEmpty) {
      await dbHelper.updateUser(id, nameController.text, int.parse(ageController.text));
      nameController.clear();
      ageController.clear();
      fetchUsers();
    }
  }

  void deleteUser(int id) async {
    await dbHelper.deleteUser(id);
    fetchUsers();
  }

  void showUpdateDialog(int id, String currentName, int currentAge) {
    nameController.text = currentName;
    ageController.text = currentAge.toString();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Update User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
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
        backgroundColor: Colors.green,
        title: Text('CRUD Example')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
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
                      subtitle: Text('Age: ${user['age']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              showUpdateDialog(user['id'], user['name'], user['age']);
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
