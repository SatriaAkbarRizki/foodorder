import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/riverpod/navbar_riverpod.dart';

final scrollProvider = StateNotifierProvider.autoDispose
    .family<ScrollNotifier, bool, String>((ref, key) {
      return ScrollNotifier(ref);
    });

class ScrollNotifier extends StateNotifier<bool> {
  ScrollNotifier(this.ref) : super(true) {
    scrollController.addListener(onScroll);
  }

  final Ref ref;
  final ScrollController scrollController = ScrollController();

  void onScroll() {
    final navVisibility = ref.read(navVisibilityProvider.notifier);
    final currentOffset = scrollController.offset;

    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (state) {
        state = false;
        navVisibility.state = false; 
      }
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!state && currentOffset > 50) {
        state = true;
        navVisibility.state = true;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
