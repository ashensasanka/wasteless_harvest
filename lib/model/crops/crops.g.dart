// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crops.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crops _$CropsFromJson(Map<String, dynamic> json) => Crops(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      plant_date: json['plant_date'] as String?,
      harvest_date: json['harvest_date'] as String?,
    );

Map<String, dynamic> _$CropsToJson(Crops instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'image': instance.image,
      'plant_date': instance.plant_date,
      'harvest_date': instance.harvest_date,
    };
