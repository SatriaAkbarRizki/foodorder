import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/model/kategori.dart';
import 'package:foodorder/repository/food.dart';
import 'package:foodorder/riverpod/detail/details_provider..dart';
import 'package:foodorder/widget/detail/dropdown.dart';
import 'package:foodorder/widget/detail/jumlahstok.dart';

class DetaillScreen extends ConsumerWidget {
  final KategoriFoodModel kategoriFoodModel;
  const DetaillScreen({super.key, required this.kategoriFoodModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jumlah = ref.watch(detailsProvider);
    final controller = ref.read(detailsProvider.notifier);
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
                      height: 230,
                    ),
                  ),
                ),
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
                      onPressed: () {},
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
                        ).textTheme.titleSmall?.copyWith(fontSize: 16),
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

// class DetaillScreen extends ConsumerWidget {
//   final nameFoodControler = TextEditingController();
//   KategoriFoodModel kategoriFoodModel;
//   DetaillScreen({super.key, required this.kategoriFoodModel});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final jumlah = ref.watch(detailsProvider); // this is jumlah
//     final providerDetails = ref.watch(detailsProvider.notifier);
//     providerDetails.setHargaFood(kategoriFoodModel.harga);

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           forceMaterialTransparency: true,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios_sharp),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               spacing: 10,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(50),
//                     child: Image.asset(
//                       'assets/images/bakso.png',
//                       fit: BoxFit.cover,
//                       height: 230,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   "Kategori ${kategoriFoodModel.nama}",
//                   style: Theme.of(
//                     context,
//                   ).textTheme.titleSmall?.copyWith(fontSize: 16),
//                 ),

//                 DropdownWidgetDetail(kategoriFoodModel: kategoriFoodModel),
//                 Text(
//                   kategoriFoodModel.deskripsi,
//                   textAlign: TextAlign.justify,
//                   maxLines: 5,

//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//                 Text(
//                   'Jumlah',
//                   style: Theme.of(
//                     context,
//                   ).textTheme.titleSmall?.copyWith(fontSize: 16),
//                 ),

//                 JumlahStokDetailWidget(kategoriFoodModel: kategoriFoodModel),

//                 const SizedBox(height: 30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       providerDetails.formatCurrency(
//                         providerDetails.totalHarga,
//                       ),
//                       style: Theme.of(context).textTheme.labelSmall,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // log(
//                         //   ref
//                         //       .watch(detailProvider(kategoriFoodModel).notifier)
//                         //       .jumlahFood
//                         //       .toString(),
//                         // );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         shape: const ContinuousRectangleBorder(
//                           borderRadius: BorderRadiusGeometry.all(
//                             Radius.circular(50),
//                           ),
//                         ),
//                         foregroundColor: Colors.black,
//                         backgroundColor: const Color(0xffcbfe01),
//                       ),
//                       child: Text(
//                         "Pesan Sekarang",
//                         style: Theme.of(
//                           context,
//                         ).textTheme.titleSmall?.copyWith(fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
