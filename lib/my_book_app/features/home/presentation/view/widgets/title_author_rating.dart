import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:flutter/material.dart';

class TitleAuthorsRating extends StatelessWidget {
  const TitleAuthorsRating({Key? key,required this.bookEntity}) : super(key: key);
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:const EdgeInsets.only(bottom: 10),
          child: Text(
            bookEntity.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
        ),
        Padding(
          padding:const EdgeInsets.only(bottom: 10),
          child: Text(bookEntity.author??'unknown',style: const TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
        ),

      ],
    );
  }
}