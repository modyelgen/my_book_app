import 'package:app_1/my_book_app/features/home/presentation/view/widgets/books_featured_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilities/functions/custom_snack_bar.dart';
import '../../../domain/entites/book_entites.dart';
import '../../manager/feature_cubit/feature_states.dart';
import '../../manager/feature_cubit/fetaure_cubit.dart';

class FeatureBlocBuilder extends StatefulWidget {
  const FeatureBlocBuilder({Key? key}) : super(key: key);

  @override
  State<FeatureBlocBuilder> createState() => _FeatureBlocBuilderState();
}

class _FeatureBlocBuilderState extends State<FeatureBlocBuilder> {
List<BookEntity>bookList=[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBooksCubit,FeatureBooksStates>(
      listener: (context,state){
        if(state is SuccessFetchFeatureBooksState){
          bookList.addAll(state.books);
        }
        else if(state is FailurePaginationFetchFeatureBooksState){
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(errMessage:state.errMessage));
        }
      },
        builder: (context,state){
          if(state is SuccessFetchFeatureBooksState||state is LoadingPaginationFetchFeatureBooksState||state is FailurePaginationFetchFeatureBooksState){
            return  FeaturedListBooks(bookEntity:bookList);
          }

          else if(state is FailureFetchFeatureBooksState){
            return Center(child: Text(state.errMessage));
          }
          else {
            return const Center(child: CircularProgressIndicator(),);
          }
        });
  }

}