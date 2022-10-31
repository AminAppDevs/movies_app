part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsmessage;

  const MovieDetailsState({this.movieDetails, this.movieDetailsState = RequestState.loading, this.movieDetailsmessage = ''});

  MovieDetailsState copyWith({MovieDetails? movieDetails, String? movieDetailsmessage, RequestState? movieDetailsState}) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsmessage: movieDetailsmessage ?? this.movieDetailsmessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
    );
  }

  @override
  List<Object> get props => [movieDetails!, movieDetailsState, movieDetailsmessage];
}
