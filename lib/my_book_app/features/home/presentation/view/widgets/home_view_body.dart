import 'package:app_1/my_book_app/features/home/presentation/view/widgets/bloc_builder_feature.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/fetch_newest_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/newest_cubit/newest_cubit.dart';


class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:const EdgeInsets.only(top:15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  const [
                CustomAppBar(),
                SizedBox(height: 20,),
                FeatureBlocBuilder(),
                SizedBox(height: 40,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Newest Books',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: NewestBlocBuilder()),
      ],

    );


  }
}














