import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({Key? key,required this.slidingAnimation}) : super(key: key);
  final Animation<Offset>slidingAnimation;
  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context,_){
        return SlideTransition(
          position: slidingAnimation,
          child: const Text('Lets Discover New Books ',
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
            textAlign: TextAlign.center,),
        );
      },
    );
  }
}
