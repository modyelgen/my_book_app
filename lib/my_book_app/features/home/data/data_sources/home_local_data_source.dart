import 'package:app_1/my_book_app/core/utilities/constants.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource
{
  List<BookEntity> fetchFeaturedBooks({int pageNumber=0});
  List<BookEntity> fetchNewestBooks({int pageNumber=0});
}
class HomeLocalDataSourceImp extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber=0}) {
    int startIndex=pageNumber*10;
    int endIndex=(pageNumber+1)*10;
   var box=Hive.box<BookEntity>(kFeaturedBox);
   int length=box.values.length;
   if(startIndex>=length||endIndex >length ){
     return [];
   }
   return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber=0}) {
    int startIndex=pageNumber*10;
    int endIndex=(pageNumber+1)*10;
    var box=Hive.box<BookEntity>(kNewestBox);
    int length=box.values.length;
    if(startIndex>=length||endIndex >length){
      return [];
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }
}
