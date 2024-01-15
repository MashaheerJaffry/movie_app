import 'package:flutter/material.dart';
import 'package:movie_app/widgets/favourite_item_widget.dart';

import '../models/movies_model_class.dart';
import '../theme&utilities/style_constants.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  final List<Movie> favoriteMovies;

  const FavoriteMoviesScreen({super.key, required this.favoriteMovies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Movies',
          style: miniHeader,
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          return FavouriteItemWidget(
            movie: favoriteMovies[index],
          );
        },
      ),
    );
  }
}
