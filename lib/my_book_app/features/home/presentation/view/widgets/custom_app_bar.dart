import 'package:app_1/my_book_app/core/utilities/nav_with_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilities/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const  EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.08,
        child: Row(
          children: [
            Image.asset(logoPath,height: 20,),
            const Spacer(),
            IconButton(onPressed: (){
              GoRouter.of(context).push(RouterApp.kSearchView);
            }, icon: const FaIcon(FontAwesomeIcons.magnifyingGlass))
          ],
        ),
      ),
    );
  }
}