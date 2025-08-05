import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousal extends StatefulWidget {
  const Carousal({super.key});

  @override
  State<Carousal> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Carousal> {

   final CarouselController carousel1 = CarouselController();
  final CarouselController carousel2 = CarouselController();



  bool auto = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('RED ROSE',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                aspectRatio: 2,
                autoPlay: auto,
                scrollDirection: Axis.horizontal,
              ),

               items: [
                Image.network(
                  "https://4kwallpapers.com/images/wallpapers/red-rose-red-flower-2560x2560-10678.jpg",
                  fit: BoxFit.fill,
                ),
                Image.network(
                  "https://c0.wallpaperflare.com/preview/625/742/561/red-roses-rose-valentines-day-roses-valentines-day.jpg",
                  fit: BoxFit.fill,
                ),
                Image.network(
                  "https://wallpapersmug.com/download/720x1280/81a4bb/beautiful-flowers-red-roses.jpg",
                  fit: BoxFit.fill,
                ),
              ],
              )
            ),

            SizedBox(
              height: 300,

               child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                aspectRatio: 1,
                autoPlay: auto,
                scrollDirection: Axis.vertical,
              ),
              items: [
                Image.network(
                  "https://4kwallpapers.com/images/wallpapers/red-rose-red-flower-2560x2560-10678.jpg",
                  fit: BoxFit.fill,
                ),
                Image.network(
                  "https://c0.wallpaperflare.com/preview/625/742/561/red-roses-rose-valentines-day-roses-valentines-day.jpg",
                  fit: BoxFit.fill,
                ),
                Image.network(
                  "https://wallpapersmug.com/download/720x1280/81a4bb/beautiful-flowers-red-roses.jpg",
                  fit: BoxFit.fill,
                ),
              ],
            )
      )]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            auto = !auto;
          });
        },
        child: const Icon(Icons.stop_sharp),
      ),
        
      );
    
  }
}