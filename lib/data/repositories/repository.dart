

import 'package:ten_twenty_asgn/data/model/GenresResponse.dart';
import 'package:ten_twenty_asgn/data/response/MovieDetailResponse.dart';
import 'package:ten_twenty_asgn/data/response/MovieVideosResponse.dart';
import 'package:ten_twenty_asgn/data/response/UpComingMoviesResponse.dart';
import 'package:ten_twenty_asgn/widgets/common_widgets.dart';

import 'package:dio/dio.dart';

class Repository {
  static String apiKey = "58802322235a3b425d6af8c80b5e58b8";
  static String imageUrl = "https://image.tmdb.org/t/p/original";
  String upcommingMoviesUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  String movieDetailUrl = "https://api.themoviedb.org/3/movie/";
  String movieSearchUrl = "https://api.themoviedb.org/3/search/movie?query=";
  String getGenresUrl =
      "https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey";
  String genresMoviesListUrl =
      "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=";

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<UpComingMoviesResponse?> getUpcomingMovies() async {
    try {
      final response = await _dio.get(upcommingMoviesUrl);
      if (response.statusCode == 200) {
        return UpComingMoviesResponse.fromJson(response.data);
      } else {
        throw Exception('Invalid request: ${response.statusCode}');
      }
    } catch (e) {
      CommonWidget().showToast(e.toString(), 1);
      return null;
    }
  }

  Future<MovieDetailResponse?> getMovieDetail(int movieId) async {
    try {
      final response = await _dio.get("$movieDetailUrl$movieId?api_key=$apiKey");
      if (response.statusCode == 200) {
        return MovieDetailResponse.fromJson(response.data);
      } else {
        throw Exception('Invalid request: ${response.statusCode}');
      }
    } catch (e) {
      CommonWidget().showToast(e.toString(), 1);
      return null;
    }
  }

  Future<MovieVideosResponse?> getMovieVideos(int movieId) async {
    try {
      final response = await _dio.get("$movieDetailUrl$movieId/videos?api_key=$apiKey");
      if (response.statusCode == 200) {
        return MovieVideosResponse.fromJson(response.data);
      } else {
        throw Exception('Invalid request: ${response.statusCode}');
      }
    } catch (e) {
      CommonWidget().showToast(e.toString(), 1);
      return null;
    }
  }

  Future<UpComingMoviesResponse?> searchMovies(String query) async {
    try {
      final response = await _dio.get("$movieSearchUrl$query&api_key=$apiKey");
      if (response.statusCode == 200) {
        return UpComingMoviesResponse.fromJson(response.data);
      } else {
        throw Exception('Invalid request: ${response.statusCode}');
      }
    } catch (e) {
      CommonWidget().showToast(e.toString(), 1);
      return null;
    }
  }

  Future<GenresResponse?> getGenres() async {
    try {
      final response = await _dio.get(getGenresUrl);
      if (response.statusCode == 200) {
        return GenresResponse.fromJson(response.data);
      } else {
        throw Exception('Invalid request: ${response.statusCode}');
      }
    } catch (e) {
      CommonWidget().showToast(e.toString(), 1);
      return null;
    }
  }

  Future<UpComingMoviesResponse?> getGenresMoviesList(int? genreId) async {
    try {
      final response = await _dio.get("$genresMoviesListUrl$genreId");
      if (response.statusCode == 200) {
        return UpComingMoviesResponse.fromJson(response.data);
      } else {
        throw Exception('Invalid request: ${response.statusCode}');
      }
    } catch (e) {
      CommonWidget().showToast(e.toString(), 1);
      return null;
    }
  }
}

