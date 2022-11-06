part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsmessage;

  final List<Recommendation> recommendations;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsmessage = '',
    this.recommendations = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith(
      {MovieDetails? movieDetails,
      String? movieDetailsmessage,
      RequestState? movieDetailsState,
      List<Recommendation>? recommendations,
      RequestState? recommendationState,
      String? recommendationMessage}) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsmessage: movieDetailsmessage ?? this.movieDetailsmessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendations: recommendations ?? this.recommendations,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsmessage,
        recommendations,
        recommendationState,
        recommendationMessage,
      ];
}
