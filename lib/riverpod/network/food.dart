import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/model/kategori.dart';
import 'package:foodorder/model/order.dart';
import 'package:foodorder/repository/food.dart';
import 'package:http/http.dart';

final foodProvider = Provider((ref) => RepoFood());
final getFoodKategoriProvider =
    FutureProvider.autoDispose<List<KategoriFoodModel>>(
      (ref) async => ref.watch(foodProvider).getAllKategori(),
    );

final createOrderProvider = FutureProvider.autoDispose
    .family<Response, OrderModel>(
      (ref, arg) async => await ref.watch(foodProvider).insertOrder(arg),
    );
