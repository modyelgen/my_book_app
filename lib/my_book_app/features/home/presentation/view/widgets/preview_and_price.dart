import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
import 'package:flutter/material.dart';

class RatingNumberPages extends StatelessWidget {
  const RatingNumberPages({Key? key,required this.book}) : super(key: key);
final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.height*0.085,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration:  BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    bottomLeft:  Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Padding(padding:const EdgeInsets.only(bottom: 3),child: Text(book.ratingAvg.toString(),style: TextStyle(color: Colors.white),)),
                  const Text('Rating',style: TextStyle(color: Colors.grey,fontSize: 12),),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration:  BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: const EdgeInsets.only(bottom: 3),child: Text(book.num0fPages.toString(),style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
                 const  Center(child: Text('Number of Page',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 12),maxLines: 2,)),
                ],
              ),
            ),

          ),
          Expanded(
            child: Container(
              decoration:  BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius:const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Padding(padding: EdgeInsets.only(bottom: 3),child: Text('Eng',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
                  Text('English',style: TextStyle(color: Colors.grey,fontSize: 12),maxLines: 2,),
                ],
              ),
            ),

          ),

        ],
      ),
    );
  }
}