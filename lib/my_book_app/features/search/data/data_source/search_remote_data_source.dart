import 'package:app_1/my_book_app/core/utilities/api_service.dart';
import 'package:app_1/my_book_app/features/home/data/models/bookModel.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';

abstract class SearchRemoteDataSource
{
  Future<List<BookEntity>> searchRemoteData({required String searchWord});
}
class SearchRemoteDataSourceImp extends SearchRemoteDataSource{
  final ApiServices apiServices;
  SearchRemoteDataSourceImp(this.apiServices);
  @override
  Future<List<BookEntity>> searchRemoteData({required String searchWord}) async
  {
    var result =await apiServices.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming+$searchWord');
    List<BookEntity>books=[];
    for(var item in result['items']){
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

}