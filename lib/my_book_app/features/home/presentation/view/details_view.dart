import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:app_1/my_book_app/features/home/presentation/view/widgets/details_body.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.bookEntity}) : super(key: key);
final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        body: Container(decoration:  BoxDecoration(
          image:DecorationImage(image: CachedNetworkImageProvider(bookEntity.image??'https://example.com/image.jpg',),fit: BoxFit.cover,opacity: 0.08),
        ),child:  DetailsViewBody(bookEntity: bookEntity,)),
      ),
    );
  }
}
