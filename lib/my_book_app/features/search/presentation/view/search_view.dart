import 'package:app_1/my_book_app/core/utilities/functions/setup_service_locator.dart';
import 'package:app_1/my_book_app/features/search/data/repos/search_repo_impl.dart';
import 'package:app_1/my_book_app/features/search/domain/use_case/fetch_searched_book_use_case.dart';
import 'package:app_1/my_book_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:app_1/my_book_app/features/search/presentation/view/widget/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        body: BlocProvider(
          create: (context)=>SearchCubit(SearchUseCase(getIt.get<SearchRepoImp>())),
            child: const SearchViewBody()),
      ),
    );
  }
}
