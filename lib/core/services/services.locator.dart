import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie.remote.datasource.dart';
import 'package:movies_app/movies/data/repository/movie.repository.dart';
import 'package:movies_app/movies/domain/repository/base.movies.repository.dart';
import 'package:movies_app/movies/domain/usecases/get.movie.details.usecase.dart';
import 'package:movies_app/movies/domain/usecases/get.now.playing.dart';
import 'package:movies_app/movies/domain/usecases/get.popular.movies.dart';
import 'package:movies_app/movies/domain/usecases/get.recommendation.usecase.dart';
import 'package:movies_app/movies/domain/usecases/get.top.rated.movies.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies.bloc.dart';

GetIt sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Movie bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    /// Usecases
    sl.registerLazySingleton(() => GetNowPlayingUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUsecase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));

    /// Datasource
    sl.registerLazySingleton<BaseMovieRemoteDatasource>(() => MovieRemoteDatasource());
  }
}
