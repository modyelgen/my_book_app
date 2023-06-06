import 'package:app_1/my_book_app/core/utilities/constants.dart';
import 'package:app_1/my_book_app/core/utilities/nav_with_router.dart';
import 'package:app_1/my_book_app/features/splash/presentation/view/widget/sliding_text_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}
late AnimationController animationController;
late Animation<Offset> slidingAnimation;
class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    initAnimation();
    navToHome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(logoPath),
       const SizedBox(height: 8,),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
  void initAnimation() {
    animationController=AnimationController(vsync: this,duration:const Duration(seconds: 2));
    slidingAnimation=Tween<Offset>(begin:const Offset(0, 10),end:Offset.zero ).animate(animationController);
    animationController.forward();
  }
  void navToHome(){
    Future.delayed(const Duration(seconds: 3),(){
      GoRouter.of(context).push(RouterApp.kHomeView);
    });
  }
}

