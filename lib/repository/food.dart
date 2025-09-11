import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodorder/model/kategori.dart';
import 'package:foodorder/model/order.dart';
import 'package:http/http.dart' as http;

class RepoFood {
  static final url = dotenv.get('URLAPINGROK');

  

  Future<List<KategoriFoodModel>> getAllKategori() async {
    final respons = await http.get(Uri.parse("$url/makanan/kategori"));
    List<dynamic> listKategori = jsonDecode(respons.body);
    return listKategori.map((e) => KategoriFoodModel.fromJson(e)).toList();
  }

  Future insertOrder(OrderModel order) async {
    log(order.toJson().toString());
    final respons = await http.post(
      headers: {'Content-Type': 'application/json'},
      Uri.parse("$url/makanan/"),
      body: jsonEncode(order.toJson()),
    );
    log(respons.statusCode.toString());
    return respons;
  }

  Future<List<OrderModel>> getListOrder() async {
    final respons = await http.get(Uri.parse("$url/makanan/"));

    List<dynamic> listOrder = jsonDecode(respons.body);
    return listOrder.map((e) => OrderModel.fromJson(e)).toList();
  }

  
}
