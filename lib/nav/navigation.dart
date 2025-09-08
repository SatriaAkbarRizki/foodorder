import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/riverpod/navbar_riverpod.dart';

class NavBar extends ConsumerWidget {
  NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNavvisible = ref.watch(navVisibilityProvider);
    final pageIndexNotifier = ref.watch(indexNavProvider.notifier).returnPage();
    return Scaffold(
      body: pageIndexNotifier,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: isNavvisible ? const Offset(0, 0) : const Offset(0, 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              elevation: 10,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              currentIndex: ref.watch(indexNavProvider),

              onTap: (value) {
                ref.read(indexNavProvider.notifier).changePage(value);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
