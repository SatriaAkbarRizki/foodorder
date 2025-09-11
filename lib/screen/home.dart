import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/repository/food.dart';
import 'package:foodorder/riverpod/home/home_provider.dart';
import 'package:foodorder/riverpod/navbar_riverpod.dart';
import 'package:foodorder/riverpod/network/food.dart';
import 'package:foodorder/riverpod/order/scrollorder.dart';
import 'package:foodorder/widget/home/food.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollNotifier = ref.watch(scrollProvider('home').notifier);
    final dataKategori = ref.watch(listFoodKategoriProvider);

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
        child: Center(
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
                          controller: scrollNotifier.scrollController,
                          itemCount: data.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () => ref
                                  .read(homeProvider.notifier)
                                  .selectUserImage(data[index]),
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
                      const FoodWidgetHome(),
                    ],
                  ),
                ),
              ],
            ),
            error: (error, stackTrace) => Text('$error'),
            loading: () =>
                CircularProgressIndicator(color: const Color(0xffcbfe01)),
          ),
        ),
      ),
    );
  }
}
