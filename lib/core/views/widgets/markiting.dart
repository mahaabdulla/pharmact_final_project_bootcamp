import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MarketingImages extends StatelessWidget {
  const MarketingImages({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/m1.jpeg',
      'assets/images/m3.jpeg',
      'assets/images/m4.jpeg',
      'assets/images/m5.jpg',
      'assets/images/m6.jpeg',
      'assets/images/m11.jpeg',
                                                                             
    ];

    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgList[itemIndex]), 
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      options: CarouselOptions(
        height: 150,
        autoPlay: true, 
        enlargeCenterPage: true, 
        aspectRatio: 16 / 9,
        autoPlayInterval: Duration(seconds: 2),
      ),
    );
  }
}
