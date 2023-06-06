import 'package:app_1/my_book_app/core/utilities/nav_with_router.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/presentation/manager/feature_cubit/fetaure_cubit.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListBooks extends StatefulWidget {
  const FeaturedListBooks({Key? key,required this.bookEntity}) : super(key: key);
final List<BookEntity> bookEntity;

  @override
  State<FeaturedListBooks> createState() => _FeaturedListBooksState();
}

class _FeaturedListBooksState extends State<FeaturedListBooks> {
  late final ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller=ScrollController();
    controller.addListener(scrollListener);
  }
  int nextPage=1;
  bool isLoading=false;
  void scrollListener()async{
    ScrollPosition scroll=controller.position;
    if(scroll.pixels>=MediaQuery.of(context).size.height*0.7){
      if(!isLoading){
        isLoading=true;
        await BlocProvider.of<FeatureBooksCubit>(context).fetchFeaturedBooks(
          pageNumber: nextPage++,
        );
        isLoading=false;
      }

    }
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height*0.28,
      child: ListView.separated(
        controller:controller ,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: const  BouncingScrollPhysics(),
        itemBuilder: (context,index)
        {
          return GestureDetector(onTap: (){
            GoRouter.of(context).push(RouterApp.kDetailsView,extra: widget.bookEntity[index]);
          },child: CustomBookImage(imageUrl: widget.bookEntity[index].image??'',));
        },
        separatorBuilder:  (context,index){
          return const SizedBox(width: 13,);
        },
        itemCount: widget.bookEntity.length,
      ),
    );
  }
}