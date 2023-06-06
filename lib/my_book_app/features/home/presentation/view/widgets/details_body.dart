import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/descritpion_reading.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/details_books_image.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/details_custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({Key? key,required this.bookEntity}) : super(key: key);
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const CustomAppBar(),
        AllBookDetails(bookEntity: bookEntity,),
         DescriptionAndReadingBook(book: bookEntity)
      ],
    );
  }
}











