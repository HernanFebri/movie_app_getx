import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/back_button.dart';

import '../../../../constants/constants.dart';
import '../../../../models/movies_model.dart';
import '../../../../utils/colors.dart';
import '../controllers/details_screen_controller.dart';

class DetailsScreenView extends GetView<DetailsScreenController> {
  DetailsScreenView({super.key});

  final Movie movie =
      Get.arguments as Movie; // Ambil data Movie dari Get.arguments

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackBtn(),
            backgroundColor: AppColors.scaffoldBgColor,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true, // Menempatkan title di tengah
              title: Text(
                movie.title,
                textAlign: TextAlign.center, // Memastikan teks berada di tengah
                style: GoogleFonts.belleza(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                child: Image.network(
                  '${Constants.imagePath}${movie.backDropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover, // Pastikan gambar tidak terdistorsi
                  width: double.infinity, // Pastikan gambar mengisi lebar layar
                  height: double.infinity, // Menjaga proporsi tinggi gambar
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                    ); // Penanganan error jika gambar gagal dimuat
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    'Overview',
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    movie.overview,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Release date : ',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              Text(
                                movie.releaseDate,
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Rating : ',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: AppColors.ratingColor,
                              ),
                              Text(
                                '${movie.voteAverage.toStringAsFixed(1)}/10',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
