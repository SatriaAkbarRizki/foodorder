import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/model/kategori.dart';
import 'package:foodorder/riverpod/detail/details_provider..dart';

class JumlahStokDetailWidget extends ConsumerWidget {
  KategoriFoodModel kategoriFoodModel;
  JumlahStokDetailWidget({super.key, required this.kategoriFoodModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var providerDetails = ref.watch(detailsProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            ref.watch(detailsProvider.notifier).decrementFoodCount();
          },
          child: const Icon(Icons.remove),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(80, 50),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(35),
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xffd43635),
          ),
        ),
        Text(
          providerDetails.toString(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
        ElevatedButton(
          onPressed: () {
            ref.watch(detailsProvider.notifier).incrementFoodCount();
          },
          child: const Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(80, 50),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(35),
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xff16c451),
          ),
        ),
      ],
    );
  }
}
