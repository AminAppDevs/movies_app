import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base.usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/usecases/get.now.playing.dart';
import 'package:movies_app/movies/domain/usecases/get.popular.movies.dart';
import 'package:movies_app/movies/domain/usecases/get.top.rated.movies.dart';
import 'package:movies_app/movies/presentation/controller/movies.event.dart';
import 'package:movies_app/movies/presentation/controller/movies.state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(this.getNowPlayingUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    /// now playing event
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingUsecase(const NoParameters());

      result.fold(
        (Failure failure) => emit(
          state.copyWith(
            nowPlayingMessage: failure.message,
            nowPlayingState: RequestState.error,
          ),
        ),
        (List<Movie> movies) => emit(
          state.copyWith(
            nowPlayingMovies: movies,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });

    /// popular event
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUsecase(const NoParameters());
      result.fold(
        (Failure failure) => emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: failure.message,
          ),
        ),
        (List<Movie> movies) => emit(
          state.copyWith(
            popularState: RequestState.loaded,
            popularMovies: movies,
          ),
        ),
      );
    });

    /// top rated event
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUsecase(const NoParameters());
      result.fold(
        (Failure failure) => emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: failure.message,
          ),
        ),
        (List<Movie> movies) => emit(
          state.copyWith(
            topRatedState: RequestState.loaded,
            topRatedMovies: movies,
          ),
        ),
      );
    });
  }
}
