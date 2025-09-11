import 'package:flutter/material.dart';
import 'package:foodorder/repository/food.dart';

class AutoAnimatedDescribe extends StatelessWidget {
  final String describe;

  const AutoAnimatedDescribe({super.key, required this.describe});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: Text(
        key: ValueKey(describe),
        describe,
        textAlign: TextAlign.justify,
        maxLines: 5,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
