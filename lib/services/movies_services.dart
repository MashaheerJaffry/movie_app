// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movies_model_class.dart';

class MovieService {
  final String AuthToken = 'Replace with your actual API key';
  final String apiKey = "Replace with your actual API key";
  final String baseUrl = "https://api.themoviedb.org/3";
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc'),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $AuthToken',
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Movie> movies = (data['results'] as List)
          .map((item) => Movie(
                id: item['id'],
                title: item['title'],
                releaseDate: item['release_date'],
                overview: item['overview'],
                posterUrl:
                    'https://image.tmdb.org/t/p/w500${item['poster_path']}',
              ))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<Movie> fetchMovieById(int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/$id?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Movie(
        id: data['id'],
        title: data['title'],
        releaseDate: data['release_date'],
        overview: data['overview'],
        posterUrl: 'https://image.tmdb.org/t/p/w500${data['poster_path']}',
      );
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
