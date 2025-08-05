import 'package:flutter/material.dart';

class Myexercise2 extends StatefulWidget {
  const Myexercise2({super.key});

  @override
  State<Myexercise2> createState() => _Myexercise2State();
}

class _Myexercise2State extends State<Myexercise2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Promotions',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
          Row(
            children: [
          SizedBox(
            width: 180,
            height: 200,
            child: Card(child: Column(
              children: [
                
                SizedBox(
                  width: 170,
                  height: 165,
                  child: Image.asset('image/photo4.jpg',
                  fit: BoxFit.cover,),
                ),
                Text('product1'),
              ],
            ),),
          ),
          SizedBox(
            width: 180,
            height: 200,
            child: Card(child: Column(
              children: [
                
                SizedBox(
                  width: 170,
                  height: 165,
                  child: Image.asset('image/computer.jpg',
                  fit: BoxFit.cover,),
                ),
                Text('product2'),
              ],
            ),),
          ),
          

            ],
          ),
          Row(
            children: [
               SizedBox(
            width: 180,
            height: 200,
            child: Card(child: Column(
              children: [
                
                SizedBox(
                  width: 170,
                  height: 165,
                  child: Image.asset('image/photo2.jpg',
                  fit: BoxFit.cover,),
                ),
                Text('product3'),
              ],
            ),),
          ),
          
              
                 
             
                  
           SizedBox(
            width: 180,
            height: 200,
            child: Card(child: Column(
              children: [
                
                SizedBox(
                  width: 170,
                  height: 165,
                  child: Image.asset('image/photo5.jpg',
                  fit: BoxFit.cover,),
                ),
                Text('product4'),
              ],
            ),),
          ),
          

            ],
          ),
          
          

          
            
         ] ),
        
      );
    
  }
}