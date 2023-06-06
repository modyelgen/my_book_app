import 'package:app_1/my_book_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../entites/book_entites.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookEntity>>>fetchFeaturedBooks({int pageNumber=0});
  Future<Either<Failure,List<BookEntity>>>fetchNewestBooks({int pageNumber=0});
}