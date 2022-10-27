import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error.message.model.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/movies/data/models/movie.model.dart';

abstract class BaseMovieRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDatasource extends BaseMovieRemoteDatasource {
  ///// Playing Now Movies
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    String path =
        '${AppConstants.baseUrl}/movie/now_playing?api_key=${AppConstants.apiKey}';
    final Response response = await Dio().get(path);

    if (response.statusCode == 200) {
      List<MovieModel> movies = (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      return movies;
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

///// Popular Movies
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    String path =
        '${AppConstants.baseUrl}/movie/popular?api_key=${AppConstants.apiKey}';
    final Response response = await Dio().get(path);

    if (response.statusCode == 200) {
      List<MovieModel> movies = (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      return movies;
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

///// Top Rated Movies
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    String path =
        '${AppConstants.baseUrl}/movie/top_rated?api_key=${AppConstants.apiKey}';
    final Response response = await Dio().get(path);

    if (response.statusCode == 200) {
      List<MovieModel> movies = (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      return movies;
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
