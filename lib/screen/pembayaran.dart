import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/model/order.dart';
import 'package:foodorder/repository/food.dart';
import 'package:foodorder/riverpod/pembayaran/pembayaran.dart';

class PembayaranScreen extends ConsumerWidget {
  final OrderModel orderModel;
  const PembayaranScreen({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataLogoProvider = ref.watch(listLogoPembayaran);
    final indexSelectPurchase = ref.watch(providerMethodPembayaran);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Pembayaran",
            style: Theme.of(context).textTheme.titleMedium,
          ),
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
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      spacing: 10,
                      children: [
                        Hero(
                          tag: 'foodimages',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              '${RepoFood.url}/assets/images/${orderModel.image}',
                              fit: BoxFit.contain,
                              height: 80,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              orderModel.nama,
                              maxLines: 2,
                              softWrap: true,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              'Jumlah: ${orderModel.jumlah}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Text(
                  "Pilih Cara Bayar Pesanan",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontSize: 14),
                ),
                Text(
                  "Tinggal sedikit lagi nih, ayo bayar  sekarang dengan berbagai pilihan metode pembayaran ",
                  textAlign: TextAlign.justify,
                  maxLines: 5,
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                ListView.builder(
                  itemCount: dataLogoProvider.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final isSelected = indexSelectPurchase == index;

                    return GestureDetector(
                      onTap: () {
                        ref.read(providerMethodPembayaran.notifier).state =
                            index;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xffcbfe01)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    dataLogoProvider[index].path,
                                    fit: BoxFit.contain,
                                    height: 35,
                                    width: 40,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 5,
                                    children: [
                                      Text(
                                        dataLogoProvider[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(fontSize: 14),
                                      ),
                                      Text(
                                        dataLogoProvider[index].deskripsi,
                                        softWrap: true,
                                        maxLines: 2,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: Color(0xffcbfe01),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Text(
                            'Bayar Sekarang',
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall?.copyWith(fontSize: 14),
                          ),
                          Spacer(),
                          Text(
                            ref.watch(
                              providerFormatHargaPembayaran(
                                orderModel.totalHarga,
                              ),
                            ),
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall?.copyWith(fontSize: 14),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_circle_right),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
