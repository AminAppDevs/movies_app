import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base.usecase.dart';
import 'package:movies_app/movies/domain/entites/movie.details.dart';
import 'package:movies_app/movies/domain/repository/base.movies.repository.dart';

class GetMovieDetailsUsecase
    extends BaseUsecase<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({required this.id});
  @override
  List<Object?> get props => [id];
}
