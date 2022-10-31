import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base.usecase.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/repository/base.movies.repository.dart';

class GetTopRatedMoviesUsecase extends BaseUsecase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
