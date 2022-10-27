import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backDropPath;
  final List<int> genderId;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.genderId,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backDropPath,
        genderId,
        overview,
        voteAverage,
      ];
}
