import 'package:blood/screen2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myblood extends StatefulWidget {
  const Myblood({super.key});

  @override
  State<Myblood> createState() => _MybloodState();
}

class _MybloodState extends State<Myblood> {
  List<String> _savedNames = [];

  @override
  void initState() {
    super.initState();
    _loadNames();
  }

  Future<void> _loadNames() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedNames = prefs.getStringList('username') ?? [];
    });
  }

  Future<void> _deleteName(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedNames.removeAt(index);
    });
    await prefs.setStringList('username', _savedNames);
  }

  Future<void> _editName(int index) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController bloodController = TextEditingController();

    List<String> details = _savedNames[index].split(' - ');
    nameController.text = details[0];
    phoneController.text = details[1];
    bloodController.text = details[2];

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Donor"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: "Phone")),
            TextField(controller: bloodController, decoration: InputDecoration(labelText: "Blood Group")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              setState(() {
                _savedNames[index] = "${nameController.text} - ${phoneController.text} - ${bloodController.text}";
              });
              await prefs.setStringList('username', _savedNames);
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 120, 27, 20),
        centerTitle: true,
        title: Text('BLOOD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Screen2()),
          );
          if (result == true) {
            _loadNames();
          }
        },
        child: Icon(Icons.add, color:  Color.fromARGB(255, 120, 27, 20),),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: _savedNames.isEmpty
          ? Center(child: Text("No donors available"))
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: _savedNames.length,
                itemBuilder: (context, index) {
                  List<String> details = _savedNames[index].split(' - ');
                  String name = details[0];
                  String phone = details[1];
                  String bloodGroup = details[2];

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:  Color.fromARGB(255, 120, 27, 20),
                        child: Text(
                          bloodGroup,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Text(phone, style: TextStyle(fontSize: 16)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editName(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color:  Colors.black),
                            onPressed: () => _deleteName(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
