// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: (json['id'] as num?)?.toInt(),
  nama: json['nama'] as String,
  jumlah: (json['jumlah'] as num).toInt(),
  kategoriMakanan: (json['kategori_makanan'] as num).toInt(),
  totalHarga: (json['total_harga'] as num).toInt(),
  image: json['image'] as String?,
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'nama': instance.nama,
      'jumlah': instance.jumlah,
      'kategori_makanan': instance.kategoriMakanan,
      'total_harga': instance.totalHarga,
      'image': ?instance.image,
    };
