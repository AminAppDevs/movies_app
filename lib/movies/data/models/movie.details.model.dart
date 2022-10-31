import 'package:movies_app/movies/domain/entites/genres.dart';
import 'package:movies_app/movies/domain/entites/movie.details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'],
        genres: List.from(json['genres']).map((e) => GenresModel.fromJson(e)).toList(),
      );
}

class GenresModel extends Genres {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(id: json['id'], name: json['name']);
}
