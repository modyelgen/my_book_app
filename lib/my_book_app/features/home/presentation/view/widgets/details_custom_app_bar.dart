import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height*0.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top:20,),
        child: Row(
          children: [
            IconButton(onPressed: (){
              GoRouter.of(context).pop();
            }, icon:const Icon( Icons.close,color: Colors.white,)),
            const Spacer(),
            IconButton(onPressed: (){}, icon: const  Icon(Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}