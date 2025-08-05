import 'package:activitysql/second.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SQLiteExample(),
    );
  }
}
class SQLiteExample extends StatefulWidget {
  @override
  _SQLiteExampleState createState() => _SQLiteExampleState();
}
class _SQLiteExampleState extends State<SQLiteExample> {
  List<Map<String, dynamic>> _users = [];
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
@override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    _users = await DBHelper.getUsers();
    setState(() {});
  }

  Future<void> _addUser() async {
    String name = _nameController.text;
    int? age = int.tryParse(_ageController.text);
    if (name.isNotEmpty && age != null) {
      await DBHelper.insertUser(name, age);
      _nameController.clear();
      _ageController.clear();
      _loadUsers();
    } else {
      _showSnackBar('Please enter valid name and age');
    }
  }

  Future<void> _deleteUser(int id) async {
    await DBHelper.deleteUser(id);
    _loadUsers();
  }

  Future<void> _editUser(int id, String name, int age) async {
    _nameController.text = name;
    _ageController.text = age.toString();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField(_nameController, 'Name'),SizedBox(height: 12,),
            _buildTextField(_ageController, 'Age', keyboardType:
TextInputType.number),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              String newName = _nameController.text;
              int? newAge = int.tryParse(_ageController.text);
              if (newName.isNotEmpty && newAge != null) {
                await DBHelper.updateUser(id, newName, newAge);
                _loadUsers();
                Navigator.pop(context);
              } else {
                _showSnackBar('Please enter valid name and age');
              }
            },
            child: Text('Save'),
          ),
          TextButton(onPressed: () => Navigator.pop(context), child:
Text('Cancel')),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String
label, {TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label, border:
OutlineInputBorder()),
      keyboardType: keyboardType,
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,
       title: Text('SQLiteExample')
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(_nameController, 'Name'),
            SizedBox(height: 10),
            _buildTextField(_ageController, 'Age', keyboardType:
TextInputType.number),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _addUser, child: Text('Add User')),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return ListTile(
                    title: Text(user['name']),
                    subtitle: Text('Age: ${user['age']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: Icon(Icons.edit), onPressed:
() => _editUser(user['id'], user['name'], user['age'])),
                        IconButton(icon: Icon(Icons.delete),
onPressed: () => _deleteUser(user['id'])),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ));
    
  }
}