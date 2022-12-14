import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movie.remote.datasource.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/entites/movie.details.dart';
import 'package:movies_app/movies/domain/entites/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base.movies.repository.dart';
import 'package:movies_app/movies/domain/usecases/get.movie.details.usecase.dart';
import 'package:movies_app/movies/domain/usecases/get.recommendation.usecase.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDatasource baseMovieRemoteDatasource;

  MovieRepository(this.baseMovieRemoteDatasource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDatasource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDatasource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDatasource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters movieDetails) async {
    final result = await baseMovieRemoteDatasource.getMovieDetails(movieDetails);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async {
    final result = await baseMovieRemoteDatasource.getRecommendation(parameters);

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}
