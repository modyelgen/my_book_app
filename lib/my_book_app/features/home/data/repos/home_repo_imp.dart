import 'package:app_1/my_book_app/core/errors/failures.dart';
import 'package:app_1/my_book_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:app_1/my_book_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp extends HomeRepo{
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImp({required this.homeLocalDataSource,required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0})async {
   List<BookEntity>booksList;
   try {
     booksList=homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
     if(booksList.isNotEmpty){
       return right(booksList);
     }
     booksList=await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
     return right(booksList);
   }  catch (e) {
     if(e is DioError) {
       return left(ServerFailure.fromDioError(e));
     }
     else {
       return left(ServerFailure(e.toString()));
     }
     }
   }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber=0}) async{
    List<BookEntity>booksList;
    try {
      booksList= homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if(booksList.isNotEmpty){
        return right(booksList);
      }
      booksList=await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
      return right(booksList);
    }  catch (e) {
      if(e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
    }

  }

