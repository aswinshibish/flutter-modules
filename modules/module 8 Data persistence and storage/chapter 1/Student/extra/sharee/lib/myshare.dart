import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myshare extends StatefulWidget {
  const Myshare({super.key});

  @override
  State<Myshare> createState() => _MyshareState();
}

class _MyshareState extends State<Myshare> {
  TextEditingController _controller=TextEditingController();
  List<String>_saveTexts=[];

  @override
  void initState(){
    super.initState();
    _loadData();
  }

  Future<void>_saveData()async{
    if(_controller.text.trim().isEmpty)return;
    SharedPreferences prefs=await SharedPreferences.getInstance();
    _saveTexts.add(_controller.text.trim());
    await prefs.setStringList('text',_saveTexts);
    _controller.clear();
    setState(() {
      
    });
  }

  Future<void>_loadData()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    _saveTexts=prefs.getStringList('texts')??[];
    setState(() {
      
    });
  }


  Future<void>_clearData()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.remove('texts');
    _saveTexts.clear();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Sharedpreference'),
        actions: [
          IconButton(onPressed: _clearData, icon: Icon(Icons.delete))
        ],
        
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter text'
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton (style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent), 
           onPressed:_saveData,
            child: Text('Save')),
          SizedBox(height: 10,),
          Expanded(child: _saveTexts.isEmpty
          ?Center(
            child: Text('No data'),
          ):ListView(children: 
            _saveTexts.map((text)=> ListTile(title: Text(text),)).toList()
          )
          ),
        ],
      ),),
    );
  }
}