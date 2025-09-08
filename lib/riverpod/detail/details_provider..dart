import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final detailsProvider = StateNotifierProvider.autoDispose(
  (ref) => DetailsNotifier(),
);

class DetailsNotifier extends StateNotifier<int> {
  DetailsNotifier() : super(1);

  List<String> listKategori = [];
  String selectKategori = '';
  int hargaFood = 1;
  int get totalHarga => hargaFood * state;

  void incrementFoodCount() {
    state += 1;
  }

  void decrementFoodCount() {
    if (state > 1) {
      state -= 1;
    }
  }

  List<String> sortData(String subkategori) {
    listKategori = List<String>.from(jsonDecode(subkategori));
    return listKategori;
  }

  void setKategori(String value) {
    selectKategori = value;
  }

  void setHargaFood(int harga) {
    hargaFood = harga;
  }

  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }
}
