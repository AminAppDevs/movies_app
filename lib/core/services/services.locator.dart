import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie.remote.datasource.dart';
import 'package:movies_app/movies/data/repository/movie.repository.dart';
import 'package:movies_app/movies/domain/repository/base.movies.repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));

    /// Datasource
    sl.registerLazySingleton<BaseMovieRemoteDatasource>(
        () => MovieRemoteDatasource());
  }
}
