import 'package:app_1/my_book_app/core/errors/failures.dart';
import 'package:app_1/my_book_app/core/use_case/general_use_case.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,int > {
 final HomeRepo homeRepo;
 FetchNewestBooksUseCase(this.homeRepo);
 @override
 Future<Either<Failure, List<BookEntity>>> call([int param=0]) async {
   return await homeRepo.fetchNewestBooks(
    pageNumber: param,
   );
 }
}
