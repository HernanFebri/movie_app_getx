import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
            viewportFraction: 0.5,
            aspectRatio: 16 / 9,
            height: 300,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1)),
        itemBuilder: (context, itemindex, pageViewIndex) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 300,
            width: 200,
            child: Center(
              child: Text(
                'Movie $itemindex',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
