import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Rose extends StatefulWidget {
  const Rose({super.key});

  @override
  State<Rose> createState() => _RoseState();
}

class _RoseState extends State<Rose> {
  bool _isPlaying = true;
  final CarouselSliderController _horizontalCarouselCntroller =
      CarouselSliderController();

  final List<String> imgList = [
    "https://media.istockphoto.com/id/173242371/photo/rose.jpg?s=612x612&w=0&k=20&c=hhotfx2Z3vf7VufW2fP-GnZSbzNZ05J2U9RNFZqMSbs=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRifgAEjcR4glG4ivLSyVNAdy60AxDscU2mg&s",
    "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L3BmLXMxMjctdGQtMDAyMV80LmpwZw.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("RED ROSE",style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
              onPressed: () {
                _horizontalCarouselCntroller.previousPage();
              },
              icon: Icon(Icons.arrow_drop_up_rounded,color: Colors.white,)),
          IconButton(
              onPressed: () {
                _horizontalCarouselCntroller.nextPage();
              },
              icon: Icon(Icons.arrow_drop_down,color: Colors.white,)),
        ],
      ),
      drawer: Drawer(
        
        
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ), //BoxDecoration
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        CircleAvatar
                        (radius: 50,
                          backgroundImage: AssetImage('lib/image/pet1.jpg',),),
                          Text('Red Rose',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),)
                      ],
                    )
                  ), //DrawerHeader
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.person,color: Colors.black,),
                      title: const Text(' Payment ',style: TextStyle(fontWeight: FontWeight.bold,),),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Payment()));
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.favorite,color: Colors.black,),
                      title: const Text(' Favorite ',style: TextStyle(fontWeight: FontWeight.bold,)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Favorite()));
                      },
                    ),
                  ),
                   
                 
                  
                 
                ],
              ),
            ),
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: [Colors.white,Colors.red])),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 100),
              child: CarouselSlider(
                carouselController: _horizontalCarouselCntroller,
                options: CarouselOptions(
                  height: 300,
                  autoPlay: _isPlaying,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 400),
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  scrollDirection: Axis.vertical,
                ),
                items: imgList.map((item) {
                  return Container(
                    child: Image.network(
                      item,
                      fit: BoxFit.contain,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          togglePlayPause();
        },
        child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.red,),
      ),
    );
  }

  void togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }
}


class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
   String _currentAnimation = "asset/tick.json";

    void _changeAnimation(String animationAsset) {       //WHEN ONE BUTTON SELECT ANIMATION SHOULD BE SELECT
    setState(() {
      _currentAnimation = animationAsset;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
       SingleChildScrollView(
         child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Center( // Centering the animation
               child: Lottie.asset(
          _currentAnimation,
          height: 800,
          width: 300,
               ),
             ),
             const SizedBox(height: 40),
             Center( // Centering the Row
               child: Row(
          mainAxisSize: MainAxisSize.min, // Ensuring minimal width
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _changeAnimation("asset/tick.json");
              },
             
            ),
          ],
               ),
             ),
           ],
         ),
         ),
       ),);

}
}

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Favorite', style: TextStyle(color: Colors.white,)),
      ),
    );
  }
}

