import 'package:flutter/material.dart';

class Buyers19 extends StatefulWidget {
  const Buyers19({Key? key}) : super(key: key);

  @override
  State<Buyers19> createState() => _Buyers19State();
}

class _Buyers19State extends State<Buyers19> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Set<String> likedItems = {};

  void toggleLike(String item) {
    setState(() {
      if (likedItems.contains(item)) {
        likedItems.remove(item);
      } else {
        likedItems.add(item);
      }
    });
  }

  String? selectedValue3;

  final List<String> items3 = ['breed1', 'breed2', 'breed3', 'breed4'];
  bool isChecked2 = false;
  bool isCheckedvac = false;
  bool isCheckedcer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Cat'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
              
            },
            icon: const Icon(Icons.filter_alt_sharp),
          ),
          
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)
          ),
        ],
      ),
      endDrawer: Drawer(
        child:Padding(padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text('filter & sort'),
            Padding(padding: EdgeInsets.only(left: 10),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: DropdownButton(
                hint: Text('BREED',
              style: TextStyle(
                color: Colors.black
              ),),
              value: selectedValue3,
              items: items3.map((String item){
                return DropdownMenuItem<String>(
                  value:item,
                child:Text(item));

              },).toList(),
              onChanged: (newValue){
                setState(() {
                  selectedValue3=newValue!;
                }
                );

              },
            ),
            )
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('age limit',
            style: TextStyle(
              fontSize: 18,
            ),),
            SizedBox(
              width: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(

                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text('data published'),
        Padding(padding: EdgeInsets.all(8),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(

            ),
            hintText: 'three days ago...',
          ),
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('looking to adopt',
            style:TextStyle(
              fontSize: 16
            ),),
            Checkbox(checkColor: Colors.white,
            value: isChecked2,
            onChanged: (bool? value){

            },),
          ],
          
        ),
        Text('pet range'),
        SizedBox(
          height: 5,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 100,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
          ),
          Text('-'),
          SizedBox(
            width: 100,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
          ),
        ],),
        SizedBox(
          height: 20,
        ),
        Padding(padding: EdgeInsets.all(8),
        child: TextField(decoration: InputDecoration(
          border: OutlineInputBorder(

          ),
          hintText: 'location'
        ),
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('vacinated',
            style: TextStyle(
              fontSize: 16
            ),),
            Checkbox(
              checkColor:Colors.white,
            value: isCheckedvac, onChanged: (bool?value){
              setState(() {
                isCheckedvac=value!;
              });
            }),
            Text('certfied',
            style: TextStyle(
              fontSize: 16
            ),),
            Checkbox(
              checkColor:Colors.white,
            value: isCheckedvac, onChanged: (bool?value){
              setState(() {
                isCheckedvac=value!;
              });
            }),
            
          ],
        ),
        SizedBox(
          width: 350,
          child: FloatingActionButton.extended(onPressed: (){},
          label: Text('apply'),
          backgroundColor: Colors.orange,),
        )
        ],
        ),)
        
        //elevation: 20.0,
        //semanticLabel: 'endDrawer',
      ),
     // Create enddrawer here
      body: ListView(
        children: [
          buildListItem("Bella", "₹ 5000"),
          buildListItem("Lucy", "₹ 1500" ),    
          buildListItem("Loki", "₹ 2000"),
          buildListItem("Milo", "₹ 10000"),
          buildListItem("Leo", "₹ 6500"),
          buildListItem("Oggy", "₹ 3500"),
        ],
      ),
    );
  }

  Widget buildListItem(String name, String price) {
    bool isLiked = likedItems.contains(name);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color.fromARGB(255, 232, 229, 229),
        child: ListTile(
          title: Text(name),
          subtitle: Text(price),
          trailing: IconButton(
            onPressed: () {
              toggleLike(name);
            },
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : null,
            ),
          ),
          leading: const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 30,
          ),
          
        ),
      ),
    );
  }
}


