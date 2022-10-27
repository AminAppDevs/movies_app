import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/data/datasource/movie.remote.datasource.dart';
import 'package:movies_app/movies/data/repository/movie.repository.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/repository/base.movies.repository.dart';
import 'package:movies_app/movies/domain/usecases/get.now.playing.dart';
import 'package:movies_app/movies/presentation/controller/movies.event.dart';
import 'package:movies_app/movies/presentation/controller/movies.state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<GetPopularMoviesEvent>((event, emit) async {
      BaseMovieRemoteDatasource baseMovieRemoteDatasource =
          MovieRemoteDatasource();
      BaseMoviesRepository baseMoviesRepository =
          MovieRepository(baseMovieRemoteDatasource);

      final result = await GetNowPlayingUsecase(baseMoviesRepository).execute();
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingMessage: l.message,
              nowPlayingState: RequestState.error)),
          (List<Movie> movies) => emit(MoviesState(
              nowPlayingMovies: movies, nowPlayingState: RequestState.loaded)));
    });
  }
}
