import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myshare extends StatefulWidget {
  const Myshare({super.key});

  @override
  State<Myshare> createState() => _MyshareState();
}

class _MyshareState extends State<Myshare> {
  TextEditingController _controller=TextEditingController();
  List<String>_savedNames=[];
  @override
  void initState(){
    super.initState();
    _loadNames();
    
  }
  

  Future<void>_loadNames()async{
    final prefs=await SharedPreferences.getInstance();
    setState(() {
      _savedNames=prefs.getStringList('username')??[];//to load the data
    });
  }

  Future <void>_saveName()async{
    if(_controller.text.isEmpty)return;

    final prefs=await SharedPreferences.getInstance();//to save the data
    _savedNames.add(_controller.text);
    await prefs.setStringList('username', _savedNames);
    _controller.clear();//clear the fields automatically when I save it
    _loadNames();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
       title: Text('shareadpreferences'),
       centerTitle: true,
      ),

      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter your name'
            ),
            
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: _saveName,//to save the data when I click save button 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          )
          , child: Text('Save name')),

          SizedBox(height: 20,),
          Expanded(child: _savedNames.isEmpty
          ?Center(child: Text('No names saved yet.'))
          :ListView.builder(itemCount: _savedNames.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(_savedNames[index],
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              );
            }))
        ],
      ),),
    );
  }
}