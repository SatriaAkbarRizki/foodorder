// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kategori.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KategoriFoodModel _$KategoriFoodModelFromJson(Map<String, dynamic> json) =>
    KategoriFoodModel(
      id: (json['id'] as num).toInt(),
      nama: json['nama'] as String,
      deskripsi: json['deskripsi'] as String,
      stok: (json['stok'] as num).toInt(),
      harga: (json['harga'] as num).toInt(),
      subkategori: json['subkategori'] as String,
      rating: (json['rating'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$KategoriFoodModelToJson(KategoriFoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'deskripsi': instance.deskripsi,
      'stok': instance.stok,
      'harga': instance.harga,
      'subkategori': instance.subkategori,
      'rating': instance.rating,
      'image': instance.image,
    };
