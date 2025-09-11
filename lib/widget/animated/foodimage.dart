import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/repository/food.dart';

class AutoAnimatedImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final double borderRadius;
  final BoxFit fit;

  const AutoAnimatedImage({
    super.key,
    required this.imageUrl,
    this.size = 200,
    this.borderRadius = 50,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: ClipRRect(
        key: ValueKey(imageUrl),
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.network(
          '${RepoFood.url}/assets/images/$imageUrl',
          fit: fit,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
