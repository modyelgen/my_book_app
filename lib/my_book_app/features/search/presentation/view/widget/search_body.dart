import 'package:app_1/my_book_app/features/home/presentation/view/widgets/newest_books_item.dart';
import 'package:app_1/my_book_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:app_1/my_book_app/features/search/presentation/manager/search_cubit/search_states.dart';
import 'package:app_1/my_book_app/features/search/presentation/view/widget/custom_search_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:const [
        CustomSearchText(),
        SizedBox(height: 20,),
        SearchListItems()
      ],
    );
  }
  
}
class SearchListItems extends StatelessWidget {
  const SearchListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SearchCubit,SearchState>(
      builder: (context,state){
         if (state is SuccessSearchState){
          return Expanded(

            child: ListView.separated(
              physics:const BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return NewestBookItem(bookEntity:state.books[index]);
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 10,);
                },
                itemCount: state.books.length,
            ),
          );
        }
        else if (state is FailureSearchState){
          return  Center(child: Text(state.errMessage));
        }
         else if(state is InitialSearchState||state is InitialAfterSearchState){
           return const Center(child:  Text('search for programming books'));
         }
        return const Center(child: CircularProgressIndicator(),);

      },
    );
  }
}


