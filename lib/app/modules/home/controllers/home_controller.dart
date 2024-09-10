import 'package:get/get.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/api/api.dart';
import '../../../../constants/constants.dart';

class HomeController extends GetxController {
  var trendingMovies = <Movie>[].obs;
  var topRatedMovies = <Movie>[].obs;
  var upComingMovies = <Movie>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTrendingMovies();
    fetchTopRatedMovies();
    fetchUpComingMovies();
  }

  void fetchTrendingMovies() async {
    try {
      isLoading(true);
      var movies = await Api().getTrendingMovies();
      for (var movie in movies) {
        movie.posterPath = Constants.imagePath + movie.posterPath;
      }
      trendingMovies.assignAll(movies);
    } finally {
      isLoading(false);
    }
  }

  void fetchTopRatedMovies() async {
    try {
      isLoading(true);
      var movies = await Api().getTopRatedMovies();
      for (var movie in movies) {
        movie.posterPath = Constants.imagePath + movie.posterPath;
      }
      topRatedMovies.assignAll(movies);
    } finally {
      isLoading(false);
    }
  }

  void fetchUpComingMovies() async {
    try {
      isLoading(true);
      var movies = await Api().getUpComingMovies();
      for (var movie in movies) {
        movie.posterPath = Constants.imagePath + movie.posterPath;
      }
      upComingMovies.assignAll(movies);
    } finally {
      isLoading(false);
    }
  }
}
