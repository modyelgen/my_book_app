
import 'package:app_1/my_book_app/core/utilities/constants.dart';
import 'package:app_1/my_book_app/core/utilities/functions/setup_service_locator.dart';
import 'package:app_1/my_book_app/core/utilities/nav_with_router.dart';
import 'package:app_1/my_book_app/features/home/data/repos/home_repo_imp.dart';
import 'package:app_1/my_book_app/features/home/domain/use_cases/fetch_feature_use_case.dart';
import 'package:app_1/my_book_app/features/home/domain/use_cases/fetch_newest_book_use_case.dart';
import 'package:app_1/my_book_app/features/home/presentation/manager/feature_cubit/fetaure_cubit.dart';
import 'package:app_1/my_book_app/features/home/presentation/manager/newest_cubit/newest_cubit.dart';
import 'package:app_1/my_book_app/simple_bloc_observer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_book_app/core/utilities/functions/prepare_hive.dart';
void main()async{
  await prepareHive();
  setUpServiceLocator();
  Bloc.observer=SimpleBlocObserver();
  runApp
    (const BookApp());

}

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context){
          return FeatureBooksCubit(FetchFeatureBookUseCase(getIt.get<HomeRepoImp>()))..fetchFeaturedBooks();
        }),
        BlocProvider(create: (context){
          return FetchNewestCubit(FetchNewestBooksUseCase(getIt.get<HomeRepoImp>()))..fetchNewestBooks();
        }),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme:ThemeData.dark().copyWith(scaffoldBackgroundColor: kColor,textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
       routerConfig: RouterApp.router,
      ),
    );
  }
}
