import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/repository/food.dart';
import 'package:foodorder/riverpod/home/home_provider.dart';
import 'package:foodorder/riverpod/navbar_riverpod.dart';
import 'package:foodorder/riverpod/network/food.dart';
import 'package:foodorder/widget/home/food.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final isVisible = ref.read(navVisibilityProvider.notifier);

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      // Hide navbar
      if (ref.read(navVisibilityProvider)) isVisible.state = false;
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      // Show navbar
      if (!ref.read(navVisibilityProvider)) isVisible.state = true;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Food Orders",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer(
          builder: (context, ref, child) {
            final dataKategori = ref.watch(getFoodKategoriProvider);

            return Center(
              child: dataKategori.when(
                data: (data) => Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100,
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: data.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: GestureDetector(
                                  onTap: () => ref
                                      .read(homeProvider.notifier)
                                      .selectUserImage(data[index]),
                                  child: Hero(
                                    tag: 'foodimagges-${data[index].id}',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        '${RepoFood.url}/assets/images/${data[index].image}',
                                        fit: BoxFit.cover,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FoodWidgetHome(),
                        ],
                      ),
                    ),
                  ],
                ),
                error: (error, stackTrace) => Text('$error'),
                loading: () =>
                    CircularProgressIndicator(color: Color(0xffcbfe01)),
              ),
            );
          },
        ),
      ),
    );
    ;
  }
}
