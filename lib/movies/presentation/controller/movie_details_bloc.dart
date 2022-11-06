import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entites/movie.details.dart';
import 'package:movies_app/movies/domain/entites/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get.movie.details.usecase.dart';
import 'package:movies_app/movies/domain/usecases/get.recommendation.usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUsecase getMovieDetailsUsecase;
  GetRecommendationUsecase getRecommendationUsecase;

  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationUsecase) : super(const MovieDetailsState()) {
    /// get movie details event
    on<GetMovieDetailsEvent>((event, emit) async {
      final result = await getMovieDetailsUsecase(MovieDetailsParameters(id: event.id));
      result.fold(
        (Failure failure) => emit(
          state.copyWith(movieDetailsState: RequestState.error, movieDetailsmessage: failure.message),
        ),
        (MovieDetails movieDetails) => emit(
          state.copyWith(movieDetailsState: RequestState.loaded, movieDetails: movieDetails),
        ),
      );
    });

    /// get recommendation event
    on<GetRecommendationEvent>((event, emit) async {
      final result = await getRecommendationUsecase(RecommendationParameters(event.id));

      result.fold(
        (l) => emit(
          state.copyWith(recommendationState: RequestState.error, recommendationMessage: l.message),
        ),
        (r) => emit(
          state.copyWith(recommendationState: RequestState.loaded, recommendations: r),
        ),
      );
    });
  }
}
