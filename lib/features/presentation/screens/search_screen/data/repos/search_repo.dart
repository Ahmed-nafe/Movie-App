import 'package:dartz/dartz.dart';
import 'package:movie/core/utils/errors.dart';
import 'package:movie/features/presentation/screens/search_screen/data/model/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchModel>> fetchSearch({required String query});
}
