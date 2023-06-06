
import 'package:app_1/my_book_app/core/utilities/api_service.dart';
import 'package:app_1/my_book_app/core/utilities/constants.dart';
import 'package:app_1/my_book_app/features/home/data/models/bookModel.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource
{
Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber=0});
Future<List<BookEntity>>fetchNewestBooks({int pageNumber=0});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource{
  final ApiServices apiServices;

  HomeRemoteDataSourceImp(this.apiServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber=0})async {
    var result=await apiServices.get(endPoint: 'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber*10}');
   List<BookEntity>books =getList(result);
   savaLocal(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber=0})async {
    var result=await apiServices.get(endPoint:'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber*10}');
    List<BookEntity>books =getList(result);
    savaLocal(books,kNewestBox);
    return books;
  }

  void savaLocal(List<BookEntity> books,String boxName) {
     var box=Hive.box<BookEntity>(boxName);
     box.addAll(books);
  }
  List<BookEntity> getList(Map<String,dynamic>data )  {
List<BookEntity>books=[];
    for(var item in data['items']){
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

}