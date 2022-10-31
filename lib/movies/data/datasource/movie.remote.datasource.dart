import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error.message.model.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/movies/data/models/movie.details.model.dart';
import 'package:movies_app/movies/data/models/movie.model.dart';
import 'package:movies_app/movies/data/models/recommendation.model.dart';
import 'package:movies_app/movies/domain/usecases/get.movie.details.usecase.dart';
import 'package:movies_app/movies/domain/usecases/get.recommendation.usecase.dart';

abstract class BaseMovieRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
}

class MovieRemoteDatasource extends BaseMovieRemoteDatasource {
  ///// Playing Now Movies
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    String path = '${AppConstants.baseUrl}/movie/now_playing?api_key=${AppConstants.apiKey}';
    final Response response = await Dio().get(path);

    if (response.statusCode == 200) {
      List<MovieModel> movies = (response.data['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
      return movies;
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

///// Popular Movies
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    String path = '${AppConstants.baseUrl}/movie/popular?api_key=${AppConstants.apiKey}';
    final Response response = await Dio().get(path);

    if (response.statusCode == 200) {
      List<MovieModel> movies = (response.data['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
      return movies;
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

///// Top Rated Movies
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    String path = '${AppConstants.baseUrl}/movie/top_rated?api_key=${AppConstants.apiKey}';
    final Response response = await Dio().get(path);

    if (response.statusCode == 200) {
      List<MovieModel> movies = (response.data['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
      return movies;
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  ///// get movie details
  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async {
    String path = '${AppConstants.baseUrl}/movie/${parameters.id}?api_key=${AppConstants.apiKey}';
    Response response = await Dio().get(path);

    if (response.statusCode == 200) {
      MovieDetailsModel movieDetails = MovieDetailsModel.fromJson(response.data);
      return movieDetails;
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async {
    String path = '${AppConstants.baseUrl}/movie/${parameters.id}/recommendations?api_key=${AppConstants.apiKey}';
    Response response = await Dio().get(path);

    if (response.statusCode == 200) {
      List<RecommendationModel> recommendations = (response.data as List).map((e) => RecommendationModel.fromJson(e)).toList();
      return recommendations;
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
