import 'package:dartz/dartz.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/PouplarModel.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';
import '../../../../../../core/utils/errors.dart';
import '../../../details_screen/data/model/MoveDetilsModel.dart';
import '../model/NewReleaseModel.dart';

abstract class HomeRepo {
  Future<Either<Failure, NewReleaseModel>> fetchNewReleases();

  Future<Either<Failure, RecommendedModel>> fetchRecommended();

  Future<Either<Failure, PopularModel>> fetchPopular();

}
