import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/widgets/trending_slider.dart';
import 'package:movie_app/widgets/movies_slider.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/logo.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Trending Movies',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.trendingMovies.isEmpty) {
                return const Center(
                  child: Text("No trending movies found"),
                );
              } else {
                return TrendingSlider(
                  movies: controller.trendingMovies,
                );
              }
            }),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Top Rated Movies",
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.topRatedMovies.isEmpty) {
                return const Center(
                  child: Text("No top rated movies found"),
                );
              } else {
                return MoviesSlider(
                  movies: controller.topRatedMovies,
                );
              }
            }),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Upcoming Movies",
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.upComingMovies.isEmpty) {
                  return const Center(
                    child: Text("No upcoming movies found"),
                  );
                } else {
                  return MoviesSlider(
                    movies: controller.upComingMovies,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
