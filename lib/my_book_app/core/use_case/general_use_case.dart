import 'package:app_1/my_book_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type,Param>{
  Future<Either<Failure,Type>> call([Param param]);
}
class NoParam{}