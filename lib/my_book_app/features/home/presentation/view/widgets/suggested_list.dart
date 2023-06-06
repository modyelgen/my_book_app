import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SuggestedBooksList extends StatelessWidget {
  const SuggestedBooksList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height*0.18,
      child: ListView.separated(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          physics:const BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return const CustomBookImage(imageUrl: '',);
          },
          separatorBuilder: (context,index)=>const SizedBox(width: 10,),
          itemCount: 10),
    );
  }
}