import 'package:app_1/my_book_app/core/utilities/api_service.dart';
import 'package:app_1/my_book_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:app_1/my_book_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:app_1/my_book_app/features/home/data/repos/home_repo_imp.dart';
import 'package:app_1/my_book_app/features/search/data/data_source/search_remote_data_source.dart';
import 'package:app_1/my_book_app/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;
void setUpServiceLocator(){
  getIt.registerSingleton<ApiServices>(ApiServices(dio: Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(
      homeLocalDataSource:HomeLocalDataSourceImp(),
      homeRemoteDataSource:HomeRemoteDataSourceImp(getIt.get<ApiServices>()),
  ));
  getIt.registerSingleton<SearchRepoImp>(SearchRepoImp(SearchRemoteDataSourceImp(getIt.get<ApiServices>())));
}