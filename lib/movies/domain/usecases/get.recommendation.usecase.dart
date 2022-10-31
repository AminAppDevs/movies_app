import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base.usecase.dart';
import 'package:movies_app/movies/domain/entites/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base.movies.repository.dart';

class GetRecommendationUsecase extends BaseUsecase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) {
    return baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;
  const RecommendationParameters(this.id);
  @override
  List<Object?> get props => [id];
}
