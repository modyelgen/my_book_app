import 'package:app_1/my_book_app/core/utilities/functions/custom_snack_bar.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/newest_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/newest_cubit/newest_cubit.dart';
import '../../manager/newest_cubit/newest_states.dart';


class NewestBlocBuilder extends StatefulWidget {
  const NewestBlocBuilder({Key? key}) : super(key: key);

  @override
  State<NewestBlocBuilder> createState() => _NewestBlocBuilderState();
}

class _NewestBlocBuilderState extends State<NewestBlocBuilder> {
  List<BookEntity>listBooks=[];
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<FetchNewestCubit,NewestBooksStates>(
      listener: (context,state){
        if(state is SuccessFetchNewestBooksState){
          listBooks.addAll(state.books);
        }
        if (state is FailurePaginationFetchNewestBooksState){
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(errMessage: state.errMessage));
        }
      },
        builder: (context,state){
      if(state is SuccessFetchNewestBooksState||state is LoadingPaginationFetchNewestBooksState||state is FailurePaginationFetchNewestBooksState){
        return  NewestBookList(bookEntity: listBooks);
      }
      else if(state is FailureFetchNewestBooksState){
        return Center(child: Text(state.errMessage));
      }
      else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}