import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  bool _isPlaying = true;
  final CarouselSliderController _horizontalCarouselCntroller =
      CarouselSliderController();

  final List<String> imgList = [
    "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg",
    "https://st1.latestly.com/wp-content/uploads/2021/08/31-6.jpg",
    "https://images5.alphacoders.com/133/1338179.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("Pet Shop"),
        actions: [
          IconButton(
              onPressed: () {
                _horizontalCarouselCntroller.previousPage();
              },
              icon: Icon(Icons.arrow_back_ios)),
          IconButton(
              onPressed: () {
                _horizontalCarouselCntroller.nextPage();
              },
              icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: [Colors.white,Colors.yellow])),
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
                  scrollDirection: Axis.horizontal,
                ),
                items: imgList.map((item) {
                  return Container(
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
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
        child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

  void togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }
}
