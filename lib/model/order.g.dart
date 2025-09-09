// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  jumlah: (json['jumlah'] as num).toInt(),
  kategoriMakanan: (json['kategori'] as num).toInt(),
  totalHarga: (json['total_harga'] as num).toInt(),
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': instance.name,
      'jumlah': instance.jumlah,
      'kategori': instance.kategoriMakanan,
      'total_harga': instance.totalHarga,
    };
