import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilities/nav_with_router.dart';
import 'custom_rating_widget.dart';

class NewestBookItem extends StatelessWidget {
  const NewestBookItem({Key? key,required this.bookEntity}) : super(key: key);
final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height*0.23,
      child: Row(
        children:  [
           GestureDetector(onTap: (){
             GoRouter.of(context).push(RouterApp.kDetailsView,extra: bookEntity);
           },child: CustomBookImage(imageUrl: bookEntity.image! ,)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0,bottom: 20,top: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.6,
                    child:  Text(bookEntity.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  ),
                  const SizedBox(height: 5,),
                   Text(bookEntity.author??'Un Known',style:const TextStyle(color: Colors.grey,fontSize: 11,),),
                  const SizedBox(height: 5,),
                   Row(children:  [
                    const Text('Free',
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                   const  Spacer(),
                     RatingNum(bookEntity: bookEntity,),
                   ],),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}