import 'package:dartz/dartz.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';
import '../../../../../../core/utils/errors.dart';
import '../model/NewReleaseModel.dart';

abstract class HomeRepo {
  Future<Either<Failure, NewReleaseModel>> fetchNewReleases();

  Future<Either<Failure, RecommendedModel>> fetchRecommended();
}
