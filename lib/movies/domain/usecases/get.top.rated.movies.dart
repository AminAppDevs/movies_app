import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/repository/base.movies.repository.dart';

class GetTopRatedMoviesUsecase {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUsecase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
