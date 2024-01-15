// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/movies_model_class.dart';
import '../services/movies_services.dart';
import '../theme&utilities/style_constants.dart';
import '../widgets/movie_item_widget.dart';
import 'favourite_movies_screen.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final MovieService _movieService = MovieService();
  late Future<List<Movie>> _movies;

  @override
  void initState() {
    super.initState();
    _movies = _movieService.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Movie List',
          style: miniHeader,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: 26.sp,
            ),
            onPressed: () async {
              // Fetch favorite movies
              List<Movie> favoriteMovies = await fetchFavoriteMovies();
              // Navigate to FavoriteMoviesScreen with arguments
              Get.to(FavoriteMoviesScreen(favoriteMovies: favoriteMovies));
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Movie> movies = snapshot.data as List<Movie>;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: movies.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return MovieItemWidget(movie: movies[index]);
              },
            );
          }
        },
      ),
    );
  }

  Future<List<Movie>> fetchFavoriteMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteMovieIds = prefs.getStringList('favoriteMovies');

    if (favoriteMovieIds != null) {
      List<Movie> favoriteMovies = [];

      // Assuming MovieService has a method to fetch details by id
      for (String id in favoriteMovieIds) {
        // Fetch detailed information about the movie by id
        Movie movieDetails = await _movieService.fetchMovieById(int.parse(id));
        favoriteMovies.add(movieDetails);
      }

      return favoriteMovies;
    }

    return [];
  }
}
