import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(includeIfNull: false)
class OrderModel {
  int? id;
  String name;
  int jumlah;
  @JsonKey(name:  "kategori")
  int kategoriMakanan;
  @JsonKey(name: 'total_harga')
  int totalHarga;

  OrderModel({
    required this.id,
    required this.name,
    required this.jumlah,
    required this.kategoriMakanan,
    required this.totalHarga,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
