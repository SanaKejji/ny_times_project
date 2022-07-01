import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AppAnimatedList extends StatelessWidget {
  const AppAnimatedList({Key? key, required this.index, required this.card}) : super(key: key);
  final int index;
  final Widget card;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 400),
        child: SlideAnimation(
          // horizontalOffset: 70.0,
          verticalOffset: -10,
          child: FadeInAnimation(
            child: card,
          ),
        ));
  }
}
