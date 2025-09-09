import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/repository/food.dart';
import 'package:foodorder/riverpod/network/food.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataOrderProvider = ref.watch(lististOrderFoodProvider);

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text("Order", style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: dataOrderProvider.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          '${RepoFood.url}/assets/images/${data[index].image}',
                          fit: BoxFit.contain,
                          height: 80,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            data[index].nama,

                            maxLines: 2,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'Jumlah: ${data[index].jumlah}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),

                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: Theme.of(
                              context,
                            ).textTheme.labelSmall?.copyWith(fontSize: 12),
                          ),
                          Text(
                            ref.read(
                              convertFormatHargaProvider(
                                data[index].totalHarga,
                              ),
                            ),
                            style: Theme.of(
                              context,
                            ).textTheme.labelSmall?.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            error: (error, stackTrace) {
              log(error.toString());
              return Text("Ada yang bermasalah ini");
            },
            loading: () => CircularProgressIndicator(color: Color(0xffcbfe01)),
          ),
        ),
      ),
    );
  }
}
