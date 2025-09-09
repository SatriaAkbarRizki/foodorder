import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(includeIfNull: false)
class OrderModel {
  int? id;
  String nama;
  int jumlah;
  @JsonKey(name: "kategori_makanan")
  int kategoriMakanan;
  @JsonKey(name: 'total_harga')
  int totalHarga;
  String? image;

  OrderModel({
    required this.id,
    required this.nama,
    required this.jumlah,
    required this.kategoriMakanan,
    required this.totalHarga,
    required this.image,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
