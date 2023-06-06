import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:flutter/material.dart';

class RatingNum extends StatelessWidget {
  const RatingNum({Key? key,required this.bookEntity}) : super(key: key);
final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
            onPressed: (){}, icon: const Icon(Icons.star,color: Colors.amber,)
        ),
         Text(
            bookEntity.ratingAvg.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
          Text(
             ('(${bookEntity.ratingCount.toString()}'')'),
            style:const TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 10)),
      ],
    );
  }
}
