import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
  ));
}

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Number Pagination Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: paginatorScreen(),
    );
  }
}

class paginatorScreen extends StatefulWidget {
  
  const paginatorScreen({super.key});

  @override
  State<paginatorScreen> createState() => _paginatorScreenState();
}

class _paginatorScreenState extends State<paginatorScreen> {
  int _currentPage =0;

  final List<Widget>_page=[
    DummyPage(title: "page 1", color: Colors.blue),
     DummyPage(title: "page 2", color: Colors.yellow),
      DummyPage(title: "page 3", color: Colors.pink),
       DummyPage(title: "page 4", color: Colors.purple)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Pagination Demo'),centerTitle: true,
        
      ),
      body: Column(children: [
        Expanded(child: Center(
          child: _page[_currentPage],
        ),),
        NumberPaginator(
          numberPages:_page.length,
          initialPage:_currentPage,
          onPageChange :(int index){
            setState(() {
              _currentPage = index;
            });
          },
        ),
        const SizedBox(height: 10,),
      ],),
    );
  }
}
class DummyPage extends StatelessWidget {
  final String title;
  final Color color;
  const DummyPage({Key?key, required this.title,required this.color}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      height: double.infinity,
      color: color,
      child: Center(
        child:Text(
          title,
          style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ) ,
      ),
    );
  }
}