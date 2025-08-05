import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Myshare extends StatefulWidget {
  const Myshare({super.key});

  @override
  State<Myshare> createState() => _MyshareState();
}

class _MyshareState extends State<Myshare> {
  TextEditingController _controller=TextEditingController();
  List<String>_saveContact=[];

  @override
  void initState(){
    super.initState();
    _loadData();
  }


  Future<void> _launchPhone(String phone) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (!await launchUrl(phoneLaunchUri)) {
      throw 'Could not launch $phoneLaunchUri';
    }
  }

  Future<void>_loadData()async{
    final prefs=await SharedPreferences.getInstance();
    setState(() {
      _saveContact=prefs.getStringList('username')??[];//to load the data
    });
  }

 
 Future<void> _saveNumber() async {
    if (_controller.text.trim().isEmpty) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _saveContact.add(_controller.text.trim());
    await prefs.setStringList("Numbers", _saveContact);
    _controller.clear();

    setState(() {});
  }

  Future<void>_clearData()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.remove('texts');
    _saveContact.clear();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Sharedpreference',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: _clearData, icon: Icon(Icons.delete,color:Colors.white,))
        ],
        
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 10,
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter number'
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton (style: ElevatedButton.styleFrom(backgroundColor: Colors.black), 
           onPressed:_saveNumber,
            child: Text('Save',style: TextStyle(color: Colors.white),)),
          SizedBox(height: 10,),
          Expanded(child: _saveContact.isEmpty
          ?Center(
            child: Text('No data'),
          ):ListView(children: 
            _saveContact.map((text)=> Card(child: ListTile(
            trailing:IconButton(onPressed: ()=> _launchPhone(text), icon: Icon(Icons.phone)
            ),
            title: Text(text),
            )
            )).toList()
          )
          ),
        ],
      ),),
    );
  }
  }