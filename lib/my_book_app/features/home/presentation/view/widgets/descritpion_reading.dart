import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entites/book_entites.dart';

class DescriptionAndReadingBook extends StatelessWidget {
  const DescriptionAndReadingBook({Key? key,required this.book}) : super(key: key);
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.31,
      width: double.infinity,
      decoration: const BoxDecoration(
        color:Color(0xff1d202b),
      ),
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.31*0.6,
              child: Scrollbar(
                thickness: 3,
                radius:const Radius.circular(4),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Description',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        const  SizedBox(height: 10,),
                        Text(book.description??'No Idea'),
                      ]),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.3*0.35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(decoration: BoxDecoration(
                          color: const Color(0xff2a2d37),
                          borderRadius: BorderRadius.circular(10),
                        ),child:  IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border,color: Colors.grey,))),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        flex: 5,
                        child: TextButton(onPressed: ()async{
                          Uri url=Uri.parse('http://books.google.com/books?id=y6FLBQAAQBAJ&printsec=frontcover&dq=programming&hl=&cd=3&source=gbs_api');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        }, child: Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color:const Color(0xfff9784b),
                          ) ,
                          child: const Center(child: Text('Start Reading',style: TextStyle(color: Colors.white),)),
                        )),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    ) ;
  }
}