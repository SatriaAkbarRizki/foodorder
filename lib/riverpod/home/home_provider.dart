import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/model/kategori.dart';
import 'package:intl/intl.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, KategoriFoodModel>(
  (ref) => HomeNotifier(),
);

class HomeNotifier extends StateNotifier<KategoriFoodModel> {
  HomeNotifier()
    : super(
        KategoriFoodModel(
          id: 1,
          nama: 'Nasi Goreng',
          deskripsi:
              'Nasi goreng khas Indonesia dengan bumbu rempah yang harum, disajikan dengan pelengkap seperti telur, ayam, atau seafood. Cocok untuk sarapan, makan siang, maupun makan malam.',
          stok: 77,
          harga: 5000,
          subkategori:
              "[\"Nasi Goreng Kampung\", \"Nasi Goreng Merah\", \"Nasi Goreng Seafood\", \"Nasi Goreng Spesial\"]",
          rating: 5,
          image: "nasi.png",
        ),
      );

  KategoriFoodModel selectUserImage(KategoriFoodModel value) => state = value;

  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }
}
