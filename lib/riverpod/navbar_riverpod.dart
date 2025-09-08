import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/screen/home.dart';
import 'package:foodorder/screen/order.dart';

final navVisibilityProvider = StateProvider<bool>((ref) => true);
final indexNavProvider = StateNotifierProvider((ref) => PageNavBarNotifier());

class PageNavBarNotifier extends StateNotifier<int> {
  List<Widget> listWIdget = [HomeScreen(), OrderScreen()];
  PageNavBarNotifier() : super(0);

  changePage(int index) => state = index;

  Widget returnPage() => listWIdget[state];
}
