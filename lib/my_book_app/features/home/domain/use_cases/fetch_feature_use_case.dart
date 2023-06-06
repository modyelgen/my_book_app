import 'package:app_1/my_book_app/core/errors/failures.dart';
import 'package:app_1/my_book_app/core/use_case/general_use_case.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeatureBookUseCase extends UseCase<List<BookEntity>,int>{
  final HomeRepo homeRepo;
  FetchFeatureBookUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([int param=0]) async {
    //permissions
    return await homeRepo.fetchFeaturedBooks(
      pageNumber: param,
    );
  }

}