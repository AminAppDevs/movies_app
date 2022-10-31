import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/entites/movie.details.dart';
import 'package:movies_app/movies/domain/entites/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get.movie.details.usecase.dart';
import 'package:movies_app/movies/domain/usecases/get.recommendation.usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters movieDetails);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters);
}
