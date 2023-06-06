import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/preview_and_price.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/title_author_rating.dart';
import 'package:flutter/material.dart';

class AllBookDetails extends StatelessWidget {
  const AllBookDetails({Key? key,required this.bookEntity}) : super(key: key);
final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    final  imageH= MediaQuery.of(context).size.height*0.5.toDouble();
    return  SizedBox(
      height: MediaQuery.of(context).size.height*0.55,
      width: double.infinity,
      child: Column(
        children:  [
          SizedBox(height: imageH*0.6,child:  CustomBookImage(imageUrl: bookEntity.image??'',)),
          SizedBox(height: imageH*0.25,width: MediaQuery.of(context).size.width*0.6,child: TitleAuthorsRating(bookEntity:bookEntity ,)),
          RatingNumberPages(book: bookEntity,),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}