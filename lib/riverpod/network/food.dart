import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/model/kategori.dart';
import 'package:foodorder/repository/food.dart';

final foodProvider = Provider((ref) => RepoFood());
final getFoodKategoriProvider =
    FutureProvider.autoDispose<List<KategoriFoodModel>>(
      (ref) async => ref.watch(foodProvider).getAllKategori(),
    );
