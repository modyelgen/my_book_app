import 'package:app_1/my_book_app/core/errors/failures.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/search/domain/repos/search_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../data_source/search_remote_data_source.dart';

class SearchRepoImp extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImp(this.searchRemoteDataSource);
  @override
  Future<Either<Failure, List<BookEntity>>> getSearchedBooks({required String searchWord}) async{
    List<BookEntity>booksList;
    try {
       booksList =await searchRemoteDataSource.searchRemoteData(searchWord: searchWord);
      return right(booksList);
    }  catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }

  }
}