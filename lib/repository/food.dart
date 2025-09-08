import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodorder/model/kategori.dart';
import 'package:http/http.dart' as http;

class RepoFood {
  static final url = dotenv.get('URLAPINGROK');

  Future<List<KategoriFoodModel>> getAllKategori() async {
    final respons = await http.get(Uri.parse("$url/makanan/kategori"));
    List<dynamic> listKategori = jsonDecode(respons.body);
    return listKategori.map((e) => KategoriFoodModel.fromJson(e)).toList();
  }
}
