import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/theme&utilities/pallets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/movies_model_class.dart';
import '../theme&utilities/style_constants.dart';

class MovieItemWidget extends StatelessWidget {
  final Movie movie;

  const MovieItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Card(
        color: Pallete.greySoft,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Pallete.greySoft),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(movie.posterUrl,
                    height: 280.h, width: 360.w, fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                        child: Text(
                      movie.title.length > 31
                          ? '${movie.title.substring(0, 31)}...'
                          : movie.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: miniTitle,
                    )),
                    IconButton(
                      icon: Icon(movie.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () {
                        movie.isFavorite = !movie.isFavorite;
                        // Update the UI
                        Get.forceAppUpdate();
                        addToFavorites(movie.id);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to add a movie to favorites
  Future<void> addToFavorites(int movieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteMovieIds =
        prefs.getStringList('favoriteMovies') ?? [];

    if (!favoriteMovieIds.contains(movieId.toString())) {
      // If the movie is not already in favorites, add it
      favoriteMovieIds.add(movieId.toString());
      await prefs.setStringList('favoriteMovies', favoriteMovieIds);
    }
  }
}
