import 'package:dartz/dartz.dart';
import '../../../../../../core/utils/errors.dart';
import '../model/NewReleaseModel.dart';

abstract class HomeRepo {
  Future<Either<Failure, NewReleaseModel>> fetchNewReleases();

// Future<Either<Failure, List<dynamic>>> fetchFeaturedBooks();
}
