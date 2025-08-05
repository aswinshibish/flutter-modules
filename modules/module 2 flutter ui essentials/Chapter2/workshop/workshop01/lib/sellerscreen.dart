import 'package:flutter/material.dart';

class Sellerscreen extends StatefulWidget {
  const Sellerscreen({super.key});

  @override
  State<Sellerscreen> createState() => _SellerscreenState();
}

class _SellerscreenState extends State<Sellerscreen> {
  // List of items for the dropdown
  final List<String> _dropdownItems = [
    'Cat',
    'Dog',
    'Bird',
    'Fish',
  ];
  int _selectedPet = 1;
  bool isChecked = false;
  double _sliderValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Image.asset(
            'assets/catpost.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Pet Nmae',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text("Breed"),
            onChanged: (String) {},
            items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        
       Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

Row(
  children: [
    Radio(
            value: 'male',
            groupValue: _selectedPet,
            onChanged: (value) {},
          ),
          Text('male'),
  ],
),
Row(
  children: [
 Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          Text('vaccinated'),
  ],
)


         
       
        ],
       ),

        Text(
          'Pet Age',
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
        Slider(
          value: _sliderValue,
          min: 0,
          max: 100,
          onChanged: (double value) {
            setState(() {
              _sliderValue = value;
            });
          },
        )
      ],
    ));
  }
}
