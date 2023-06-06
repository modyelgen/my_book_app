import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/presentation/manager/newest_cubit/newest_cubit.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/newest_books_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookList extends StatefulWidget {
  const NewestBookList({Key? key,required this.bookEntity,}) : super(key: key);
final List<BookEntity> bookEntity;

  @override
  State<NewestBookList> createState() => _NewestBookListState();
}

class _NewestBookListState extends State<NewestBookList> {
late final ScrollController scrollController;
@override
  void initState(){
  super.initState();
    scrollController=ScrollController();
    scrollController.addListener(scrollListener);
  }
  bool isLoading=false;
  int nextPage=1;
  void scrollListener()async{
  ScrollPosition scroll=scrollController.position;
  if(scroll.pixels >= 0.7* scroll.maxScrollExtent){
    if(!isLoading){
      isLoading=true;
      await BlocProvider.of<FetchNewestCubit>(context).fetchNewestBooks(
        pageNumber: nextPage++,
      );
      isLoading=false;
    }

  }
  }
@override
void dispose() {
  scrollController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        controller: scrollController,
          shrinkWrap: true,
          padding:const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context,index){
            return NewestBookItem(bookEntity:widget.bookEntity[index],);
          }, separatorBuilder: (context,index)=>const SizedBox(height: 10,),
          itemCount:widget.bookEntity.length,

    );
  }
}