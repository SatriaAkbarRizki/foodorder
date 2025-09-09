import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/model/kategori.dart';
import 'package:foodorder/model/order.dart';
import 'package:foodorder/repository/food.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

final foodProvider = Provider((ref) => RepoFood());
final listFoodKategoriProvider =
    FutureProvider.autoDispose<List<KategoriFoodModel>>(
      (ref) async => ref.watch(foodProvider).getAllKategori(),
    );

final createOrderProvider = FutureProvider.autoDispose
    .family<Response, OrderModel>(
      (ref, arg) async => await ref.watch(foodProvider).insertOrder(arg),
    );

final lististOrderFoodProvider = FutureProvider.autoDispose<List<OrderModel>>(
  (ref) async => await ref.watch(foodProvider).getListOrder(),
);

final convertFormatHargaProvider = Provider.family<String, int>((ref, args) {
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return formatter.format(args);
});
