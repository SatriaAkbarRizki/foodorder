import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/model/kategori.dart';
import 'package:foodorder/model/order.dart';
import 'package:foodorder/repository/food.dart';
import 'package:foodorder/riverpod/detail/details_provider..dart';
import 'package:foodorder/riverpod/network/food.dart';
import 'package:foodorder/widget/detail/dropdown.dart';
import 'package:foodorder/widget/detail/jumlahstok.dart';
import 'package:foodorder/widget/snackbar.dart';

class DetaillScreen extends ConsumerWidget {
  final KategoriFoodModel kategoriFoodModel;
  const DetaillScreen({super.key, required this.kategoriFoodModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jumlah = ref.watch(detailsProvider);
    final controller = ref.watch(detailsProvider.notifier);

    controller.setHargaFood(kategoriFoodModel.harga);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      '${RepoFood.url}/assets/images/${kategoriFoodModel.image}',
                      fit: BoxFit.cover,
                      height: 180,
                      width: 200,
                    ),
                  ),
                ),
                SizedBox(),
                Text(
                  "Kategori ${kategoriFoodModel.nama}",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontSize: 16),
                ),
                DropdownWidgetDetail(kategoriFoodModel: kategoriFoodModel),
                Text(
                  kategoriFoodModel.deskripsi,
                  textAlign: TextAlign.justify,
                  maxLines: 5,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Jumlah',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontSize: 16),
                ),
                JumlahStokDetailWidget(kategoriFoodModel: kategoriFoodModel),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.formatCurrency(controller.totalHarga),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final orderFood = OrderModel(
                          id: null,
                          nama: controller.selectKategori.isNotEmpty
                              ? controller.selectKategori
                              : controller.listKategori.first,
                          jumlah: jumlah,
                          kategoriMakanan: kategoriFoodModel.id,
                          totalHarga: controller.totalHarga,
                          image: null,
                        );

                        try {
                          final response = await ref.refresh(
                            createOrderProvider(orderFood).future,
                          );

                          if (response.statusCode == 200 && context.mounted) {
                            context.showSnackBarMessage(
                              'Pesan sedang dibuat',
                              StatusSnackBar.succes,
                            );

                            ref.invalidate(detailsProvider);
                            Navigator.pop(context);
                          } else {
                            log('Failed: ${response.statusCode}');
                          }
                        } catch (e) {
                          log('Error: $e');
                          if (context.mounted) {
                            context.showSnackBarMessage(
                              e.toString(),
                              StatusSnackBar.error,
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xffcbfe01),
                      ),
                      child: Text(
                        "Pesan Sekarang",
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall?.copyWith(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
