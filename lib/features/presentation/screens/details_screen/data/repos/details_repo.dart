import 'package:dartz/dartz.dart';

import '../../../../../../core/utils/errors.dart';
import '../model/MoveDetilsModel.dart';

abstract class DetailsRepo {

  Future<Either<Failure, MovieDetailsModel>> fetchDetailsMovie(
      {required int movieId});
}