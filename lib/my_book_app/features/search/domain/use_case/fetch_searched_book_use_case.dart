import 'package:app_1/my_book_app/core/errors/failures.dart';
import 'package:app_1/my_book_app/core/use_case/general_use_case.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/search/domain/repos/search_repos.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase extends UseCase<List<BookEntity>,String>{
  final SearchRepo searchRepo;
  SearchUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([String?param]) {
    return searchRepo.getSearchedBooks(searchWord: param!);
  }
}