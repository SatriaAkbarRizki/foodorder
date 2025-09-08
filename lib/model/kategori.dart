import 'package:json_annotation/json_annotation.dart';

part 'kategori.g.dart';

@JsonSerializable()
class KategoriFoodModel {
    int id;
    String nama;
    String deskripsi;
    int stok;
    int harga;
    String subkategori;
    int rating;
    String image;

  KategoriFoodModel({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.stok,
    required this.harga,
    required this.subkategori,
    required this.rating,
    required this.image
  });

  factory KategoriFoodModel.fromJson(Map<String, dynamic> json) =>
      _$KategoriFoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$KategoriFoodModelToJson(this);
}
