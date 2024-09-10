import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/movies_model.dart';
import '../../../../constants/constants.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    super.key,
    required this.movies,
  });

  final RxList<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movies.length, // Update to use the length of the movies list
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 200,
                width: 150,
                child: movie.posterPath != null
                    ? Image.network(
                        Constants.imagePath + movie.posterPath!,
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Text(
                          'No Image Available',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
