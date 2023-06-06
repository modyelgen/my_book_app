import 'package:app_1/my_book_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomSearchText extends StatelessWidget {
  const CustomSearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16),
      child: TextField(
        onChanged: (String value){
          BlocProvider.of<SearchCubit>(context).fetchWord(searchWord: value);
        },
        onSubmitted: (String value){
          BlocProvider.of<SearchCubit>(context).fetchSearchBooks();
        },
        decoration: InputDecoration(
            hintText: 'Type here ...',
            hintStyle: const TextStyle(color: Colors.grey),
            border: buildOutlineInputBorder(),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            suffixIcon:IconButton(onPressed: (){
              BlocProvider.of<SearchCubit>(context).fetchSearchBooks();
            },icon: const FaIcon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,),),
            prefixIcon: IconButton(onPressed: (){
              GoRouter.of(context).pop();
            },icon: const FaIcon(FontAwesomeIcons.arrowLeft,color: Colors.white,),)
        ),
      ),
    );

  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }
}