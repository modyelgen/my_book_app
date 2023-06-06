import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/details_view.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/home_view.dart';
import 'package:app_1/my_book_app/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/search/presentation/view/search_view.dart';
abstract class RouterApp
{
  static const kHomeView='/homeView';
  static const kSearchView='/searchView';
  static const kDetailsView='/detailsView';
 static final router=GoRouter(routes: [
   GoRoute(path: '/',builder: (context,state)=>const SplashView()),
   GoRoute(path: kHomeView,builder: (context,state)=>const HomeView()),
   GoRoute(path: kSearchView,builder: (context,state)=>const SearchView()),
   GoRoute(path: kDetailsView,builder: (context,state)=>  DetailsView(bookEntity:state.extra as BookEntity)),
 ]);
}