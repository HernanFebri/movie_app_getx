import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';

class TrendingSlider extends StatelessWidget {
  final List<Movie> movies;

  TrendingSlider({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: movies.length, // Sesuaikan jumlah item dengan jumlah film
        options: CarouselOptions(
          viewportFraction: 0.5,
          aspectRatio: 16 / 9,
          height: 300,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, index, realIndex) {
          final movie = movies[index]; // Dapatkan movie berdasarkan index
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 300,
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie.posterPath, // URL gambar dari movie
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                      Icons.error); // Tampilkan ikon jika gagal memuat gambar
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
