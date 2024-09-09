import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/colors.dart';
import '../../../../widgets/movies_slider.dart';
import '../../../../widgets/trending_slider.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Trending Movies',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TrendingSlider(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Top Rated Movies",
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MoviesSlider(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Upcoming Movies",
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MoviesSlider()
          ],
        ),
      ),
    );
  }
}
