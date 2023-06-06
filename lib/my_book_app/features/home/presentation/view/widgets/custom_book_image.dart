import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key,required this.imageUrl}) : super(key: key);
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
        aspectRatio: 2/3,
        child: ClipRRect(
            borderRadius:BorderRadius.circular(12),
            child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.fill,errorWidget: (context,error,data){
              return const Icon(Icons.error,color: Colors.amber,);
            }))
    );
  }
}