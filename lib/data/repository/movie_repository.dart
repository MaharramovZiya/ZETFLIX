// movie_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_api_bloc/constant/api/api_keys.dart';
import 'package:movies_api_bloc/models/movie_model.dart';
import 'package:movies_api_bloc/models/video_model.dart';

class MovieRepository {
  final String baseUrl = 'https://api.themoviedb.org/3';
  static const String _trendingApi =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${APIConstants.api_key}';
  static const _upcomingMoviesApi =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${APIConstants.api_key}';
  static const _popularMoviesApi =
      'https://api.themoviedb.org/3/movie/popular?api_key=${APIConstants.api_key}';
  static const _topRateMoviesApi =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${APIConstants.api_key}';
  Future<Movie> fetchTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingApi));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return Movie.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load trending movies');
    }
  }
//This feature is used to show a list of upcoming movies
  Future<Movie> fetchUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingMoviesApi));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return Movie.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
//This feature is used to show a list of Popular Movies
  Future<Movie> fetchPopularMovies() async {
    final response = await http.get(Uri.parse(_popularMoviesApi));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return Movie.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
//This feature is used to show a list of Top rated movies
  Future<Movie> fetchTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRateMoviesApi));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return Movie.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  //This function is used to display movie trailers.
  Future<Video?> fetchMovieTrailer(int movieId) async {
    final String url =
        '$baseUrl/movie/$movieId/videos?language=en-US&api_key=${APIConstants.api_key}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['results'] != null && data['results'].isNotEmpty) {
        // İlk videoyu alıyoruz
        final videoData = data['results'][0];
        return Video.fromJson(videoData);
      }
    }
    return null;
  }

}
