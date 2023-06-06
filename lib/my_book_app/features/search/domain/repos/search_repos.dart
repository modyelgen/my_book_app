import 'package:app_1/my_book_app/core/errors/failures.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookEntity>>> getSearchedBooks({required String searchWord});
}